import 'package:flutter/material.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:rodilo/global_variables.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    GoTransition.defaultCurve = Curves.easeOut;
    GoTransition.defaultDuration = const Duration(milliseconds: 400);

    return MaterialApp.router(
      routerConfig: router,
      theme: theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
