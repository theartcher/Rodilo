import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                  onTap: () => context.go('/calculate'),
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
              child: GestureDetector(
                onTap: () => context.go('/estimate'),
                child: const Center(
                  child: Text(
                    'Estimate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
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
