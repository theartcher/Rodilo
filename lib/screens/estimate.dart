import 'package:flutter/material.dart';
import 'package:rodilo/classes/dice_matrix.dart';
import 'package:rodilo/classes/dice_size.dart';
import 'package:rodilo/classes/dice_type.dart';
import 'package:rodilo/global_variables.dart';
import 'package:rodilo/stores/estimate_notifier.dart';
import 'package:rodilo/widgets/dice/dice.dart';

class EstimateScreen extends StatelessWidget {
  const EstimateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final store = EstimateNotifier();
    final diceSpacing = defaultSpacing * 4;

    final headerTitleStyle = TextStyle(
      fontSize: defaultDiceFontSize * 0.75,
      color: colorTheme.onSecondary,
    );

    final headerValueStyle = TextStyle(
      fontSize: defaultDiceFontSize,
      color: colorTheme.primary,
    );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;

        if (velocity > defaultSwipeVelocity) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: colorTheme.secondary,
        body: ListenableBuilder(
          listenable: store,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: diceSpacing,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: diceSpacing * 1.5,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Min",
                          style: headerTitleStyle,
                        ),
                        Text(
                          "${store.minRoll}",
                          style: headerValueStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Avg",
                          style: headerTitleStyle,
                        ),
                        Text(
                          "${store.avgRoll}",
                          style: headerValueStyle,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Max",
                          style: headerTitleStyle,
                        ),
                        Text(
                          "${store.maxRoll}",
                          style: headerValueStyle,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: diceSpacing,
                  children: [
                    Dice(
                      diceType: DiceType.low,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.blue1),
                      disabled: !store.selectedDie[DiceIndex.blue1]!.enabled,
                    ),
                    Dice(
                      diceType: DiceType.low,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.blue2),
                      disabled: !store.selectedDie[DiceIndex.blue2]!.enabled,
                    )
                  ],
                ),
                Row(
                  spacing: diceSpacing,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dice(
                      diceType: DiceType.middle,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.yellow1),
                      disabled: !store.selectedDie[DiceIndex.yellow1]!.enabled,
                    ),
                    Dice(
                      diceType: DiceType.middle,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.yellow2),
                      disabled: !store.selectedDie[DiceIndex.yellow2]!.enabled,
                    )
                  ],
                ),
                Row(
                  spacing: diceSpacing,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Dice(
                      diceType: DiceType.high,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.red1),
                      disabled: !store.selectedDie[DiceIndex.red1]!.enabled,
                    ),
                    Dice(
                      diceType: DiceType.high,
                      size: DiceSize.large,
                      onPress: () => store.toggleDiceEnabled(DiceIndex.red2),
                      disabled: !store.selectedDie[DiceIndex.red2]!.enabled,
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
