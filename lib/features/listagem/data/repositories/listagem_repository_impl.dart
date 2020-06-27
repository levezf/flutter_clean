import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/network/network_info.dart';
import 'package:flutter_clean/features/listagem/data/datasources/contagem_local_datasource.dart';
import 'package:flutter_clean/features/listagem/data/datasources/contagem_remote_datasource.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem_pais.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';


class ListagemRepositoryImpl extends ListagemRepository {
  final ContagemRemoteDataSource remoteDataSource;
  final ContagemLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ListagemRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Contagem>> getContagemGlobal() async {
    return _getContagem<ContagemModel>(() {
      return remoteDataSource.getContagemGlobal();
    }, () {
      return localDataSource.getLastContagemGlobal();
    }, (remoteData) {
      localDataSource.cacheContagemGlobal(remoteData);
    });
  }

  @override
  Future<Either<Failure, List<ContagemPais>>> getContagemPorPais() async {
    return _getContagem<List<ContagemPaisModel>>(() {
      return remoteDataSource.getContagemPorPais();
    }, () {
      return localDataSource.getLastContagemPorPais();
    }, (remoteData) {
      localDataSource.cacheContagemPaises(remoteData);
    });
  }

  Future<Either<Failure, T>> _getContagem<T>(
      Future<T> Function() getRemoteContagem,
      Future<T> Function() getLocalContagem,
      Function(T contagem) saveLocal) async {
    if (await networkInfo.isConnected) {
      try {
        final remote = await getRemoteContagem();
        saveLocal(remote);
        return Right(remote);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final local = await getLocalContagem();
        return Right(local);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
