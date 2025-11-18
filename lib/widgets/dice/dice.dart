import 'package:flutter/material.dart';
import 'package:rodilo/classes/dice_size.dart';
import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';

class Dice extends StatelessWidget {
  final DiceType diceType;
  final bool disabled;
  final DiceSize size;
  final VoidCallback? onPress;

  const Dice({
    super.key,
    required this.diceType,
    this.onPress,
    this.size = DiceSize.small,
    this.disabled = false,
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

  double _getDiceSize() {
    switch (size) {
      case DiceSize.small:
        return defaultDiceDimensions;
      case DiceSize.large:
        return defaultDiceDimensions * 1.5;
    }
  }

  double _getFontSize() {
    switch (size) {
      case DiceSize.small:
        return defaultDiceFontSize;
      case DiceSize.large:
        return defaultDiceFontSize * 1.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final opacity = disabled ? 0.5 : 1.0;

    return GestureDetector(
      onTap: onPress,
      child: Opacity(
        opacity: opacity,
        child: Container(
          width: _getDiceSize(),
          height: _getDiceSize(),
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
                  fontSize: _getFontSize(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
