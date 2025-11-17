import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';

const desiredToBestDice = {
  1: [DiceType.low],
  2: [DiceType.low],
  3: [DiceType.low],
  4: [DiceType.middle],
  5: [DiceType.middle],
  6: [DiceType.middle],
  7: [DiceType.high],
  8: [DiceType.high],
  9: [DiceType.high],
  10: [DiceType.middle, DiceType.middle],
  11: [DiceType.middle, DiceType.middle],
  12: [DiceType.low, DiceType.middle, DiceType.middle],
  13: [DiceType.middle, DiceType.high],
  14: [DiceType.low, DiceType.low, DiceType.middle, DiceType.middle],
  15: [DiceType.low, DiceType.middle, DiceType.high],
  16: [DiceType.high, DiceType.high],
  17: [DiceType.low, DiceType.low, DiceType.middle, DiceType.high],
  18: [DiceType.middle, DiceType.middle, DiceType.high],
  19: [DiceType.middle, DiceType.middle, DiceType.high],
  20: [DiceType.low, DiceType.middle, DiceType.middle, DiceType.high],
};

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

  static calculateDiceForResult(int desiredResult) {
    if (desiredResult < minCardValue || desiredResult > maxCardValue) {
      return [];
    }

    return desiredToBestDice[desiredResult] ?? [];
  }
}
