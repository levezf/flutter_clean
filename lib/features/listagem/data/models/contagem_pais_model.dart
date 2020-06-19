import 'package:flutter_clean/features/listagem/domain/entities/contagem_pais.dart';

class ContagemPaisModel extends ContagemPais {
  ContagemPaisModel(
      String country,
      String countryCode,
      String slug,
      double newConfirmed,
      double totalConfirmed,
      double newDeaths,
      double totalDeaths,
      double newRecovered,
      double totalRecovered)
      : super(
            country: country,
            countryCode: countryCode,
            slug: slug,
            newConfirmed: newConfirmed,
            totalConfirmed: totalConfirmed,
            newDeaths: newDeaths,
            totalDeaths: totalDeaths,
            newRecovered: newRecovered,
            totalRecovered: totalRecovered);

  factory ContagemPaisModel.fromJson(Map<String, dynamic> json) {
    if (json == null ||
        json['Country'] == null ||
        json['CountryCode'] == null ||
        json['Slug'] == null) return null;

    return ContagemPaisModel(
        (json['Country']),
        (json['CountryCode']),
        (json['Slug']),
        (json['NewConfirmed'] as num).toDouble(),
        (json['TotalConfirmed'] as num).toDouble(),
        (json['NewDeaths'] as num).toDouble(),
        (json['TotalDeaths'] as num).toDouble(),
        (json['NewRecovered'] as num).toDouble(),
        (json['TotalRecovered'] as num).toDouble());
  }
}
