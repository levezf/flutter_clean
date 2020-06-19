
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean/features/listagem/domain/usecases/get_contagem_global.dart';
import 'package:dartz/dartz.dart';

class MockListagemRepository extends Mock implements ListagemRepository{}

void main(){

  GetContagemGlobal usecase;
  MockListagemRepository mockListagemRepository;

  setUp((){
    mockListagemRepository = MockListagemRepository();
    usecase = GetContagemGlobal(mockListagemRepository);
  });

  final tContagem = Contagem(10, 100, 1, 20, 5, 50);

  test(
      'consegue recuperar a contagem global do repositório',
          ()async{

        when(mockListagemRepository.getContagemGlobal())
            .thenAnswer((_) async => Right(tContagem));

        final result  = await usecase(NoParams());

        expect(result, Right(tContagem));
        verify(mockListagemRepository.getContagemGlobal());
        verifyNoMoreInteractions(mockListagemRepository);
      });
}