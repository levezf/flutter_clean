import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';

abstract class ContagemLocalDataSource{
  /// Retorna um [ContagemModel] que foi buscado na última vez
  /// que o usuário teve conexão com a internet
  ///
  /// Lança [CacheException] se não existir cache
  Future<ContagemModel> getLastContagemGlobal();
  
  /// Retorna um [List<ContagemPaisModel>] que foi buscado na última vez
  /// que o usuário teve conexão com a internet
  ///
  /// Lança [CacheException] se não existir cache
  Future<List<ContagemPaisModel>> getLastContagemPorPais();
  
  Future<void> cacheContagemGlobal(ContagemModel contagemToCache);

  Future<void> cacheContagemPaises(List<ContagemPaisModel> contagensPaisToCache);
}