import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';

abstract class ContagemRemoteDataSource{
  
  /// Retorna a contagem global
  /// 
  /// Lança um [ServerException] para todos os códigos de erros
  Future<ContagemModel> getContagemGlobal();

  /// Retorna a contagem por país
  /// 
  /// Lança um [ServerException] para todos os códigos de erros
  Future<List<ContagemPaisModel>> getContagemPorPais();
}