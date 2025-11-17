import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';

class DiceUtility {
  static calculateMin(List<DiceType> die) {
    int totalMin = 0;

    for (var dice in die) {
      totalMin += (dice.lowValue);
    }

    return totalMin;
  }

  static calculateAverage(List<DiceType> die) {
    int totalAvg = 0;

    for (var dice in die) {
      totalAvg += (dice.middleValue);
    }

    return totalAvg;
  }

  static calculateMax(List<DiceType> die) {
    int totalMax = 0;

    for (var dice in die) {
      totalMax += (dice.highValue);
    }

    return totalMax;
  }

  static calculateDiceForResult(int desiredResult) : List<DiceType> {
    if (desiredResult < minCardValue || desiredResult > maxCardValue) {
      return [];
    }

    // Here we should calculate the dice required to get the best average for the desired result
  }
}
