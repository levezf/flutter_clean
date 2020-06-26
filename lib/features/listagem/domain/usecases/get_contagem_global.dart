
import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import 'package:flutter_clean/core/usecases/usecase.dart';
import 'package:flutter_clean/features/listagem/domain/repositories/listagem_repository.dart';

import '../entities/contagem.dart';

class GetContagemGlobal implements UseCase<Contagem, NoParams>{

  final ListagemRepository repository;

  GetContagemGlobal(this.repository);

  @override
  Future<Either<Failure, Contagem>> call(NoParams noParams) async {
    return repository.getContagemGlobal();
  }

}
