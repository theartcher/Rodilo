import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rodilo/screens/calculate.dart';
import 'package:rodilo/screens/estimate.dart';
import 'package:rodilo/screens/home.dart';

// Card Values
const maxCardValue = 20;
const minCardValue = 1;

// Color Palette
const Color primaryColor = Color(0xFF665D55);
const Color onPrimaryColor = Color(0xFFEDEDED);
const Color secondaryColor = Color(0xFFD2C5AF);
const Color onSecondaryColor = Color(0xFF35312E);
const Color redDiceColor = Color(0xFFBF3E25);
const Color onRedDiceColor = Color(0xFFFFFFFF);
const Color blueDiceColor = Color(0xFF2B5DBC);
const Color onBlueDiceColor = Color(0xFFFFFFFF);
const Color yellowDiceColor = Color(0xFFDAA93C);
const Color onYellowDiceColor = Color(0xFF000000);

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
