import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rodilo/global_variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final fontSize = 40.0;

    return Scaffold(
      body: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;

            if (velocity < -defaultSwipeVelocity) {
              context.go(scoreBoardRoute);
            }
          },
          onVerticalDragEnd: (details) {
            final velocity = details.primaryVelocity ?? 0;

            if (velocity > defaultSwipeVelocity) {
              context.go(estimateRoute);
            }

            if (velocity < -defaultSwipeVelocity) {
              context.go(calculateRoute);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.go(calculateRoute),
                  child: Container(
                    color: colorTheme.primary,
                    child: Center(
                      child: Text(
                        'Calculate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colorTheme.onPrimary,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.go(scoreBoardRoute),
                  child: Container(
                    color: colorTheme.tertiary,
                    child: Center(
                      child: Text(
                        'Scoreboard',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colorTheme.onTertiary,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => context.go(estimateRoute),
                  child: Container(
                    color: colorTheme.secondary,
                    child: Center(
                      child: Text(
                        'Estimate',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: colorTheme.onSecondary,
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
