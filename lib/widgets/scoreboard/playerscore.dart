import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rodilo/global_variables.dart';
import 'package:rodilo/stores/scoreboard_notifier.dart';
import 'package:rodilo/widgets/scoreboard/edit_score_dialog.dart';

class PlayerScoreCard extends StatelessWidget {
  final int playerIndex;
  final String name;
  final int round1Score;
  final int round2Score;
  final int round3Score;
  final int totalScore;

  const PlayerScoreCard({
    super.key,
    required this.playerIndex,
    required this.name,
    required this.round1Score,
    required this.round2Score,
    required this.round3Score,
    required this.totalScore,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => _showEditDialog(context),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: defaultSpacing * 2,
          vertical: defaultSpacing,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultRounding),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultSpacing * 2,
                vertical: defaultSpacing * 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultRounding),
                  topRight: Radius.circular(defaultRounding),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    totalScore.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            // Round scores
            _buildRoundRow(
              '1ST',
              round1Score,
              oddRowSurfaceColor,
              colorTheme.onSurface,
            ),
            _buildRoundRow(
              '2ND',
              round2Score,
              evenRowSurfaceColor,
              colorTheme.onSurface,
            ),
            _buildRoundRow(
              '3RD',
              round3Score,
              oddRowSurfaceColor,
              colorTheme.onSurface,
              isLastRow: true,
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final notifier = context.read<ScoreboardNotifier>();

    showDialog(
      context: context,
      builder: (context) => EditScoreDialog(
        playerIndex: playerIndex,
        playerName: name,
        round1Score: round1Score,
        round2Score: round2Score,
        round3Score: round3Score,
        onSave: (round, score) {
          notifier.updateScore(playerIndex, round, score);
        },
      ),
    );
  }

  Widget _buildRoundRow(
    String round,
    int score,
    Color surface,
    Color onSurface, {
    bool isLastRow = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultSpacing * 2,
        vertical: defaultSpacing * 1.5,
      ),
      decoration: BoxDecoration(
        borderRadius: isLastRow
            ? BorderRadius.only(
                bottomLeft: Radius.circular(defaultRounding),
                bottomRight: Radius.circular(defaultRounding),
              )
            : null,
        color: surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            round,
            style: TextStyle(
              color: onSurface,
              fontSize: 20,
            ),
          ),
          Text(
            score.toString(),
            style: TextStyle(
              color: onSurface,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
