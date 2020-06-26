
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem_pais.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';

class GetContagemPorPais implements UseCase<List<ContagemPais>, NoParams>{

final ListagemRepository repository;

  GetContagemPorPais(this.repository);

  @override
  Future<Either<Failure, List<ContagemPais>>> call(NoParams noParams) async {
    return repository.getContagemPorPais();
  }
}