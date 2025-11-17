# Rodilo

Rodilo (Row-DI-yo) is a companion app for the game called 'Armadillo'. This app consists of 2 major functionalities;

- **Calculate**: This finds the best possible combination of dice for the card you want to reach.
- **Estimate**: Helps you find the min/average/max of any combination of dice.

## Getting started

1. Install Flutter SDK from [flutter.dev](https://flutter.dev/docs/get-started/install)
2. Clone this repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the app

## Dice probability calculation

The mappings of the required input number can be found in the [`dice_utils.dart`](./lib/utils/dice_utils.dart) file, while the probability calculations are implemented in [`dice_probability_calculator.py`](./dice_probability_calculator.py).
