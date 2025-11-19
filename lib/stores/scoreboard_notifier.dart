import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ScoreboardNotifier extends ChangeNotifier {
  static const _scoreBoardKey = 'local_scoreboard';
  List<PlayerScoreData> _players = [];
  bool _isLoading = true;

  List<PlayerScoreData> get players => _players;
  bool get isLoading => _isLoading;

  ScoreboardNotifier() {
    _loadScoreboard();
  }

  /// Load scoreboard from local storage
  Future<void> _loadScoreboard() async {
    final localPreferences = await SharedPreferences.getInstance();
    final rawScoreBoard = localPreferences.getString(_scoreBoardKey);

    if (rawScoreBoard != null && rawScoreBoard.isNotEmpty) {
      final List<dynamic> scoreBoard = jsonDecode(rawScoreBoard);
      _players =
          scoreBoard.map((json) => PlayerScoreData.fromJson(json)).toList();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Save scoreboard to local storage
  Future<void> _saveScoreboard() async {
    final localPreferences = await SharedPreferences.getInstance();
    final rawScoreBoard = jsonEncode(_players.map((p) => p.toJson()).toList());
    await localPreferences.setString(_scoreBoardKey, rawScoreBoard);
  }

  void addPlayer(String name) {
    if (name.trim().isEmpty) {
      return;
    }

    _players.add(PlayerScoreData(name: name.trim()));
    notifyListeners();
    _saveScoreboard();
  }

  void removePlayer(int index) {
    if (index >= 0 && index < _players.length) {
      _players.removeAt(index);
      notifyListeners();
      _saveScoreboard();
    }
  }

  void updateScore(int playerIndex, int round, int score) {
    if (playerIndex >= 0 && playerIndex < _players.length) {
      _players[playerIndex].setScore(round, score);
      notifyListeners();
      _saveScoreboard();
    }
  }

  void resetScores() {
    for (var player in _players) {
      player.resetScores();
    }
    notifyListeners();
    _saveScoreboard();
  }

  void clearAll() {
    _players.clear();
    notifyListeners();
    _saveScoreboard();
  }

  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();
    await _loadScoreboard();
  }
}

class PlayerScoreData {
  String name;
  int round1Score;
  int round2Score;
  int round3Score;

  PlayerScoreData({
    required this.name,
    this.round1Score = 0,
    this.round2Score = 0,
    this.round3Score = 0,
  });

  int get totalScore => round1Score + round2Score + round3Score;

  void setScore(int round, int score) {
    switch (round) {
      case 1:
        round1Score = score;
        break;
      case 2:
        round2Score = score;
        break;
      case 3:
        round3Score = score;
        break;
    }
  }

  void resetScores() {
    round1Score = 0;
    round2Score = 0;
    round3Score = 0;
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'round1Score': round1Score,
        'round2Score': round2Score,
        'round3Score': round3Score,
      };

  factory PlayerScoreData.fromJson(Map<String, dynamic> json) =>
      PlayerScoreData(
        name: json['name'] as String,
        round1Score: json['round1Score'] as int? ?? 0,
        round2Score: json['round2Score'] as int? ?? 0,
        round3Score: json['round3Score'] as int? ?? 0,
      );
}
