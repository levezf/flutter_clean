
import 'package:equatable/equatable.dart';

class Contagem extends Equatable{

  final double newConfirmed;
  final double totalConfirmed;
  final double newDeaths;
  final double totalDeaths;
  final double newRecovered;
  final double totalRecovered;

  Contagem(this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered) : super([]);

}