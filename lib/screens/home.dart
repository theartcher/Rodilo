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
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
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
    );
  }
}
