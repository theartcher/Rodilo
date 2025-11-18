import 'package:flutter/material.dart';
import 'package:rodilo/classes/dice_matrix.dart';
import 'package:rodilo/classes/dice_state.dart';
import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/utils/dice_utils.dart';

class EstimateNotifier extends ChangeNotifier {
  final Map<DiceIndex, DiceState> _selectedDie = {
    DiceIndex.blue1: DiceState(type: DiceType.low, enabled: true),
    DiceIndex.blue2: DiceState(type: DiceType.low, enabled: false),
    DiceIndex.yellow1: DiceState(type: DiceType.middle, enabled: false),
    DiceIndex.yellow2: DiceState(type: DiceType.middle, enabled: true),
    DiceIndex.red1: DiceState(type: DiceType.high, enabled: true),
    DiceIndex.red2: DiceState(type: DiceType.high, enabled: false),
  };
  Map<DiceIndex, DiceState> get selectedDie => _selectedDie;

  int _minRoll = 10;
  int get minRoll => _minRoll;

  int _avgRoll = 10;
  int get avgRoll => _avgRoll;

  int _maxRoll = 10;
  int get maxRoll => _maxRoll;

  EstimateNotifier() {
    _recalculateRolls();
  }

  void toggleDiceEnabled(DiceIndex index) {
    if (_selectedDie.containsKey(index)) {
      _selectedDie[index]!.enabled = !_selectedDie[index]!.enabled;
      _recalculateRolls();
      notifyListeners();
    }
  }

  void isDiceEnabled(DiceIndex index, bool enabled) {
    if (_selectedDie.containsKey(index)) {
      _selectedDie[index]!.enabled = enabled;
    }
  }

  /// Get only the enabled dice as a list of DiceType
  List<DiceType> _getEnabledDice() {
    return _selectedDie.values
        .where((diceState) => diceState.enabled)
        .map((diceState) => diceState.type)
        .toList();
  }

  void _recalculateRolls() {
    final enabledDice = _getEnabledDice();
    _minRoll = DiceUtility.calculateMinimumRoll(enabledDice);
    _avgRoll = DiceUtility.calculateAverageRoll(enabledDice);
    _maxRoll = DiceUtility.calculateMaximumRoll(enabledDice);

    notifyListeners();
  }
}
