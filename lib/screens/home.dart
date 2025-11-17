import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rodilo/global_variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: colorTheme.primary,
                child: GestureDetector(
                  onTap: () => context.go(calculateRoute),
                  child: Center(
                    child: Text(
                      'Calculate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorTheme.onPrimary,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: colorTheme.secondary,
                child: GestureDetector(
                  onTap: () => context.go(estimateRoute),
                  child: Center(
                    child: Text(
                      'Estimate',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colorTheme.onSecondary,
                        fontSize: 40,
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
