
import 'package:flutter/foundation.dart';
import 'contagem.dart';

class ContagemPais extends Contagem{

  String country;
  String countryCode;
  String slug;
  
  ContagemPais({
    @required this.country,
    @required this.countryCode,
    @required this.slug,
    double newConfirmed =0,
    double totalConfirmed=0,
    double newDeaths=0,
    double totalDeaths=0,
    double newRecovered=0,
    double totalRecovered=0,
  }) : super(
    newConfirmed,
    totalConfirmed,
    newDeaths,
    totalDeaths,
    newRecovered,
    totalRecovered);


  @override
  List get props => [slug, countryCode];

}