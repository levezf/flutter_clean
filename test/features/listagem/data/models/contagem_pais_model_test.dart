import 'dart:convert';

import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';


void main(){
  final tContagemModel = ContagemPaisModel("Afghanistan","AF","afghanistan",658, 27532, 42, 546, 1502, 7660);

  test(
    'é uma subclasse de entidade Contagem', 
    () async {

      expect(tContagemModel, isA<ContagemPaisModel>());
    });
    
  group('fromJson', (){

    test(
      'consegue converter um json em um objeto',
      () async {
        final Map<String, dynamic> jsonMap =
          json.decode(fixture('summary.json')) as Map<String, dynamic>;
      
        final Map<String, dynamic> jsonPais = (jsonMap['Countries'] as List).elementAt(0) as Map<String, dynamic>;

        final result = ContagemPaisModel.fromJson(jsonPais);

        expect(result, tContagemModel);
      }
    );

    test(
      'consegue processar os dados de um país quando não existe dados no json e não lança exception',
      () async {
        final Map<String, dynamic> jsonMapNodata =
          json.decode(fixture('summary_no_data.json')) as Map<String, dynamic>;

        final resultNoData = ContagemPaisModel.fromJson(jsonMapNodata);

        expect(resultNoData, null);
      }
    );

  });
}