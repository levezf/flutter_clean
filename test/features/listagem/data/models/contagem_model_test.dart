import 'dart:convert';

import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';


void main(){
  final tContagemModel = ContagemModel(139412, 8590132, 5071, 462325, 81144, 4154448);

  test(
    'é uma subclasse de entidade Contagem', 
    () async {

      expect(tContagemModel, isA<ContagemModel>());
    });
    
  group('fromJson', (){

    test(
      'consegue retornar os dados globais quando existe no json',
      () async {
        final Map<String, dynamic> jsonMap =
          json.decode(fixture('summary.json')) as Map<String, dynamic>;

        final result = ContagemModel.fromJson(jsonMap);

        expect(result, tContagemModel);
      }
    );

    test(
      'consegue processar os dados globais quando não existe dados no json e não lança exception',
      () async {
        final Map<String, dynamic> jsonMapNodata =
          json.decode(fixture('summary_no_data.json')) as Map<String, dynamic>;

        final Map<String, dynamic> jsonMapNoGlobal =
          json.decode(fixture('summary_no_global.json')) as Map<String, dynamic>;


        final resultNoData = ContagemModel.fromJson(jsonMapNodata);
        final resultNoGlobal = ContagemModel.fromJson(jsonMapNoGlobal);

        expect(resultNoData, null);
        expect(resultNoGlobal, null);
      }
    );

  });
}