import 'package:rodilo/classes/dice_type.dart';

class DiceState {
  final DiceType type;
  bool enabled;

  DiceState({required this.type, this.enabled = true});
}
