import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/exceptions.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/platform/network_info.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';
import 'package:flutter_clean/features/listagem/data/repositories/listagem_repository_impl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean/features/listagem/data/datasources/contagem_local_datasource.dart';
import 'package:flutter_clean/features/listagem/data/datasources/contagem_remote_datasource.dart';

class MockRemoteDataSource extends Mock implements ContagemRemoteDataSource {}

class MockLocalDataSource extends Mock implements ContagemLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ListagemRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ListagemRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body){
     group('dispositivo online', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        });
        body();
     });
  }


  void runTestsOffline(Function body){
     group('dispositivo offline', () {
        setUp(() {
          when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        });
        body();
     });
  }

  group('getContagemGlobal', () {
    final tContagemModel =
        ContagemModel(139412, 8590132, 5071, 462325, 81144, 4154448);
    final tContagem = tContagemModel;

    test('Verifica se o dispositivo está online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getContagemGlobal();

      verify(mockNetworkInfo.isConnected);
    });

    group('Contagem Global', () {
      runTestsOnline(() {
        test('consegue retornar os dados quando chama o remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemGlobal())
              .thenAnswer((_) async => tContagemModel);

          final result = await repository.getContagemGlobal();

          verify(mockRemoteDataSource.getContagemGlobal());
          expect(result, equals(Right(tContagem)));
        });

        test('consegue cachear os dados quando chama o remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemGlobal())
              .thenAnswer((_) async => tContagemModel);

          await repository.getContagemGlobal();

          verify(mockRemoteDataSource.getContagemGlobal());
          verify(mockLocalDataSource.cacheContagemGlobal(tContagemModel));
          verifyNoMoreInteractions(mockLocalDataSource);
        });

        test(
            'consegue retornar failures quando não consegue chamar remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemGlobal())
              .thenThrow(ServerException());

          final result = await repository.getContagemGlobal();

          verify(mockRemoteDataSource.getContagemGlobal());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        });
      });

      runTestsOffline(() {
        test('consegue retornar os dados cacheados localmente quando existe', () async {
          
          when(mockLocalDataSource.getLastContagemGlobal())
              .thenAnswer((_) async => tContagemModel);

          final result = await repository.getContagemGlobal();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastContagemGlobal());
          expect(result, equals(Right(tContagem)));
        });

        test('consegue retornar failure quando os dados cacheados localmente não estão disponiveis', () async {
          
          when(mockLocalDataSource.getLastContagemGlobal())
              .thenThrow(CacheException());

          final result = await repository.getContagemGlobal();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastContagemGlobal());
          expect(result, equals(Left(CacheFailure())));
        });
      });
    });
  });






  group('getContagemPorPais', () {
    final tListContagemPaisModel = 
        [ContagemPaisModel("Afghanistan","AF","afghanistan",658, 27532, 42, 546, 1502, 7660)];
    final tListContagemPais = tListContagemPaisModel;

    test('Verifica se o dispositivo está online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getContagemPorPais();

      verify(mockNetworkInfo.isConnected);
    });

    group('Contagem Global', () {
      runTestsOnline(() {
        test('consegue retornar os dados quando chama o remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemPorPais())
              .thenAnswer((_) async => tListContagemPaisModel);

          final result = await repository.getContagemPorPais();

          verify(mockRemoteDataSource.getContagemPorPais());
          expect(result, equals(Right(tListContagemPais)));
        });

        test('consegue cachear os dados quando chama o remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemPorPais())
              .thenAnswer((_) async => tListContagemPaisModel);

          await repository.getContagemPorPais();

          verify(mockRemoteDataSource.getContagemPorPais());
          verify(mockLocalDataSource.cacheContagemPaises(tListContagemPaisModel));
          verifyNoMoreInteractions(mockLocalDataSource);
        });

        test(
            'consegue retornar failures quando não consegue chamar remoteDataSource',
            () async {
          when(mockRemoteDataSource.getContagemPorPais())
              .thenThrow(ServerException());

          final result = await repository.getContagemPorPais();

          verify(mockRemoteDataSource.getContagemPorPais());
          verifyZeroInteractions(mockLocalDataSource);
          expect(result, equals(Left(ServerFailure())));
        });
      });

      runTestsOffline(() {
        test('consegue retornar os dados cacheados localmente quando existe', () async {
          
          when(mockLocalDataSource.getLastContagemPorPais())
              .thenAnswer((_) async => tListContagemPaisModel);

          final result = await repository.getContagemPorPais();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastContagemPorPais());
          expect(result, equals(Right(tListContagemPais)));
        });

        test('consegue retornar failure quando os dados cacheados localmente não estão disponiveis', () async {
          
          when(mockLocalDataSource.getLastContagemPorPais())
              .thenThrow(CacheException());

          final result = await repository.getContagemPorPais();

          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastContagemPorPais());
          expect(result, equals(Left(CacheFailure())));
        });
      });
    });
  });
  
}
