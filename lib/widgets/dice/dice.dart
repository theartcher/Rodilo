import 'package:flutter/material.dart';
import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';

class Dice extends StatelessWidget {
  final DiceType diceType;
  final bool disabled;
  final VoidCallback? onPress;

  const Dice({
    super.key,
    required this.diceType,
    this.disabled = false,
    this.onPress,
  });

  Color _getDiceColor() {
    switch (diceType) {
      case DiceType.low:
        return blueDiceColor;
      case DiceType.middle:
        return yellowDiceColor;
      case DiceType.high:
        return redDiceColor;
    }
  }

  Color _getOnDiceColor() {
    switch (diceType) {
      case DiceType.low:
        return onBlueDiceColor;
      case DiceType.middle:
        return onYellowDiceColor;
      case DiceType.high:
        return onRedDiceColor;
    }
  }

  int _getNumber() {
    switch (diceType) {
      case DiceType.low:
        return DiceType.low.lowValue;
      case DiceType.middle:
        return DiceType.middle.lowValue;
      case DiceType.high:
        return DiceType.high.lowValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final opacity = disabled ? 0.5 : 1.0;
    final diceWidthAndHeight = 90.0;

    return GestureDetector(
      onTap: disabled ? null : onPress,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: diceWidthAndHeight,
          height: diceWidthAndHeight,
          decoration: BoxDecoration(
            color: _getDiceColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Transform.translate(
              offset: const Offset(1, 5),
              child: Text(
                '${_getNumber()}',
                style: TextStyle(
                  color: _getOnDiceColor(),
                  fontSize: 48,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
