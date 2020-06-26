import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';

abstract class ContagemRemoteDataSource{
  Future<ContagemModel> getContagemGlobal();
  Future<List<ContagemPaisModel>> getContagemPorPais();
}