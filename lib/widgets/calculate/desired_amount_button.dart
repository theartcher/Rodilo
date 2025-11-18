import 'package:flutter/material.dart';

class DesiredAmountButton extends StatelessWidget {
  final VoidCallback onPress;
  final int amountToChange;
  final bool isDisabled;

  const DesiredAmountButton({
    super.key,
    required this.onPress,
    required this.amountToChange,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    final backgroundColor = isDisabled
        ? colorTheme.onPrimary.withValues(alpha: 0.4)
        : colorTheme.onPrimary;

    final textColor = isDisabled
        ? colorTheme.onSecondary.withValues(alpha: 0.4)
        : colorTheme.onSecondary;

    return Expanded(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isDisabled ? 0.6 : 1.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
          child: Material(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(35),
            child: InkWell(
              onTap: isDisabled ? null : onPress,
              borderRadius: BorderRadius.circular(35),
              splashColor: colorTheme.onSecondary.withValues(alpha: 0.3),
              highlightColor: colorTheme.onSecondary.withValues(alpha: 0.1),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 15,
                ),
                child: Center(
                  child: Transform.translate(
                    offset: const Offset(1, 5),
                    child: Text(
                      "$amountToChange",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
