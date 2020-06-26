import 'package:flutter_clean/features/listagem/domain/entities/contagem.dart';

class ContagemModel extends Contagem {
  
  ContagemModel(double newConfirmed, double totalConfirmed, double newDeaths,
      double totalDeaths, double newRecovered, double totalRecovered)
      : super(newConfirmed, totalConfirmed, newDeaths, totalDeaths,
            newRecovered, totalRecovered);


  factory ContagemModel.fromJson(Map<String, dynamic> json){
    
    if(json== null || json['Global'] == null) return null;

    return ContagemModel(
      (json['Global']['NewConfirmed'] as num).toDouble(),
      (json['Global']['TotalConfirmed'] as num).toDouble(),
      (json['Global']['NewDeaths'] as num).toDouble(),
      (json['Global']['TotalDeaths'] as num).toDouble(),
      (json['Global']['NewRecovered'] as num).toDouble(),
      (json['Global']['TotalRecovered'] as num).toDouble()
    );
  }
}
