
import 'package:equatable/equatable.dart';

class Contagem extends Equatable{

  double newConfirmed;
  double totalConfirmed;
  double newDeaths;
  double totalDeaths;
  double newRecovered;
  double totalRecovered;

  Contagem(this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered) : super([]);

}