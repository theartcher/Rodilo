enum DiceType {
  low(1, 2, 3),
  middle(4, 5, 6),
  high(7, 8, 9);

  final int lowValue;
  final int middleValue;
  final int highValue;

  const DiceType(
    this.lowValue,
    this.middleValue,
    this.highValue,
  );
}
