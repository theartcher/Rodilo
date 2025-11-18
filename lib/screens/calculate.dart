import 'package:flutter/material.dart';
import 'package:rodilo/global_variables.dart';
import 'package:rodilo/stores/calculate_notifier.dart';
import 'package:rodilo/widgets/calculate/desired_amount_button.dart';
import 'package:rodilo/widgets/dice/dice.dart';

class CalculateScreen extends StatelessWidget {
  const CalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final store = CalculateNotifier();

    bool isButtonDisabled(int desiredChange) {
      int newValue = store.desiredRoll + desiredChange;

      if (newValue < minCardValue || newValue > maxCardValue) {
        return true;
      }

      return false;
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragEnd: (details) {
        final velocity = details.primaryVelocity ?? 0;

        if (velocity < -defaultSwipeVelocity) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: colorTheme.primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: defaultSpacing,
          children: [
            Text(
              "I want to roll a...",
              style: TextStyle(
                fontSize: 30,
                color: colorTheme.onPrimary,
              ),
            ),
            ListenableBuilder(
              listenable: store,
              builder: (context, child) {
                return Text(
                  "${store.desiredRoll}",
                  style: TextStyle(
                    fontSize: 80,
                    color: colorTheme.onPrimary,
                  ),
                );
              },
            ),
            Text(
              "You should throw...",
              style: TextStyle(
                fontSize: 30,
                color: colorTheme.onPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ListenableBuilder(
                  listenable: store,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: store.die
                          .map(
                            (diceType) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4.0,
                              ),
                              child: Dice(
                                diceType: diceType,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }),
            ),
            ListenableBuilder(
              listenable: store,
              builder: (context, child) {
                return Column(
                  children: [
                    Row(
                      children: [
                        DesiredAmountButton(
                          onPress: () => store.decrement(1),
                          amountToChange: -1,
                          isDisabled: isButtonDisabled(-1),
                        ),
                        DesiredAmountButton(
                          onPress: () => store.increment(1),
                          amountToChange: 1,
                          isDisabled: isButtonDisabled(1),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        DesiredAmountButton(
                          onPress: () => store.decrement(5),
                          amountToChange: -5,
                          isDisabled: isButtonDisabled(-5),
                        ),
                        DesiredAmountButton(
                          onPress: () => store.increment(5),
                          amountToChange: 5,
                          isDisabled: isButtonDisabled(5),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        DesiredAmountButton(
                          onPress: () => store.decrement(10),
                          amountToChange: -10,
                          isDisabled: isButtonDisabled(-10),
                        ),
                        DesiredAmountButton(
                          onPress: () => store.increment(10),
                          amountToChange: 10,
                          isDisabled: isButtonDisabled(10),
                        )
                      ],
                    )
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
