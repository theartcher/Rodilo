import 'package:flutter/material.dart';
import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';
import 'package:rodilo/utils/dice_utils.dart';

class CalculateNotifier extends ChangeNotifier {
  late List<DiceType> _die;
  List<DiceType> get die => _die;

  int _desiredRoll = 10;
  int get desiredRoll => _desiredRoll;

  CalculateNotifier() {
    _die = DiceUtility.calculateDiceForResult(_desiredRoll);
  }

  void increment(int amountToAdd) {
    int expectedTotal = _desiredRoll + amountToAdd;

    if (expectedTotal > maxCardValue) {
      return;
    }

    _desiredRoll += amountToAdd;
    _die = DiceUtility.calculateDiceForResult(_desiredRoll);
    notifyListeners();
  }

  void decrement(int amountToRemove) {
    int expectedTotal = _desiredRoll - amountToRemove;

    if (expectedTotal < minCardValue) {
      return;
    }

    _desiredRoll -= amountToRemove;
    _die = DiceUtility.calculateDiceForResult(_desiredRoll);
    notifyListeners();
  }
}
