import 'dart:convert';

import 'package:flutter_clean/features/listagem/data/models/contagem_model.dart';
import 'package:flutter_clean/features/listagem/data/models/contagem_pais_model.dart';
import 'package:flutter_clean/features/listagem/domain/entities/contagem.dart';
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
          json.decode(fixture('summary.json'));
        print(jsonMap['Countries']);
        final result = ContagemPaisModel.fromJson(jsonMap['Countries'][0]);

        expect(result, tContagemModel);
      }
    );

    test(
      'consegue processar os dados de um país quando não existe dados no json e não lança exception',
      () async {
        final Map<String, dynamic> jsonMapNodata =
          json.decode(fixture('summary_no_data.json'));

        final resultNoData = ContagemPaisModel.fromJson(jsonMapNodata);

        expect(resultNoData, null);
      }
    );

  });
}