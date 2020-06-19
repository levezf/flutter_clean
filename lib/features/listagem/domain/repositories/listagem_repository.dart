

import 'package:dartz/dartz.dart';
import 'package:flutter_clean/core/error/failures.dart';
import '../entities/contagem_pais.dart';
import '../entities/contagem.dart';

abstract class ListagemRepository {

  Future<Either<Failure, List<ContagemPais>>> getContagemPorPais();
  Future<Either<Failure, Contagem>> getContagemGlobal();
} 