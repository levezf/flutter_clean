
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem_pais.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';
import 'package:flutter_clean/features/listagem/domain/usecases/get_contagem_por_pais.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class MockListagemRepository extends Mock implements ListagemRepository{}

void main(){

  GetContagemPorPais usecase;
  MockListagemRepository mockListagemRepository;

  setUp((){
    mockListagemRepository = MockListagemRepository();
    usecase = GetContagemPorPais(mockListagemRepository);
  });

  final tListContagem = [ContagemPais(
    country: 'Brazil', 
    countryCode: 'BR', 
    slug: 'brazil',
    newConfirmed: 10,
    totalConfirmed: 100,
    newDeaths: 1,
    totalDeaths: 20,
    newRecovered: 5,
    totalRecovered: 50)];

  test(
      'consegue recuperar a contagem por país do repositório',
          ()async{

        when(mockListagemRepository.getContagemPorPais())
            .thenAnswer((_) async => Right(tListContagem));

        final result  = await usecase(NoParams());

        expect(result, Right(tListContagem));
        verify(mockListagemRepository.getContagemPorPais());
        verifyNoMoreInteractions(mockListagemRepository);
      });
}