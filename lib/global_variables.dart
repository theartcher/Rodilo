import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_transitions/go_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodilo/screens/calculate.dart';
import 'package:rodilo/screens/estimate.dart';
import 'package:rodilo/screens/home.dart';

// Card Values
const maxCardValue = 20;
const minCardValue = 1;

// Color Palette
const Color primaryColor = Color.fromARGB(255, 102, 93, 85);
const Color onPrimaryColor = Color.fromRGBO(237, 237, 237, 1);
const Color secondaryColor = Color.fromRGBO(210, 197, 175, 1);
const Color onSecondaryColor = Color.fromRGBO(53, 49, 46, 1);

// Dice Colors
const Color redDiceColor = Color.fromRGBO(191, 62, 37, 1);
const Color onRedDiceColor = Color.fromRGBO(255, 255, 255, 1);
const Color blueDiceColor = Color.fromRGBO(43, 93, 188, 1);
const Color onBlueDiceColor = Color.fromRGBO(255, 255, 255, 1);
const Color yellowDiceColor = Color.fromRGBO(218, 169, 60, 1);
const Color onYellowDiceColor = Color.fromRGBO(0, 0, 0, 1);

var theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.luckiestGuyTextTheme(),
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: onPrimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    error: Colors.red.shade700,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
  ),
);

const calculateRoute = '/calculate';
const estimateRoute = '/estimate';
const homeRoute = '/';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: homeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: calculateRoute,
          pageBuilder: GoTransitions.slide.toBottom.call,
          builder: (BuildContext context, GoRouterState state) {
            return const CalculateScreen();
          },
        ),
        GoRoute(
          path: estimateRoute,
          builder: (BuildContext context, GoRouterState state) {
            return const EstimateScreen();
          },
        ),
      ],
    ),
  ],
);
