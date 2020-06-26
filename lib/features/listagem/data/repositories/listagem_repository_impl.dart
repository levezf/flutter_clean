
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem_pais.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';

class ListagemRepositoryImpl extends ListagemRepository{
  
  @override
  Future<Either<Failure, Contagem>> getContagemGlobal() {
  
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ContagemPais>>> getContagemPorPais() {
  
    throw UnimplementedError();
  }

}