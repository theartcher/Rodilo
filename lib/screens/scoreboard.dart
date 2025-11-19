import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rodilo/global_variables.dart';
import 'package:rodilo/stores/scoreboard_notifier.dart';
import 'package:rodilo/widgets/scoreboard/playerscore.dart';

class ScoreBoardScreen extends StatelessWidget {
  const ScoreBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return ChangeNotifierProvider(
      create: (_) => ScoreboardNotifier(),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragEnd: (details) {
          final velocity = details.primaryVelocity ?? 0;

          if (velocity > defaultSwipeVelocity) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          backgroundColor: colorTheme.tertiary,
          body: SafeArea(
            child: Consumer<ScoreboardNotifier>(
              builder: (context, notifier, _) {
                if (notifier.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: onTertiaryColor,
                    ),
                  );
                }

                return Column(
                  children: [
                    Expanded(
                      child: notifier.players.isEmpty
                          ? const Center(
                              child: Text(
                                'No players created yet.',
                                style: TextStyle(
                                  color: onTertiaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: notifier.players.length,
                              itemBuilder: (context, index) {
                                final player = notifier.players[index];

                                return PlayerScoreCard(
                                  playerIndex: index,
                                  name: player.name,
                                  round1Score: player.round1Score,
                                  round2Score: player.round2Score,
                                  round3Score: player.round3Score,
                                  totalScore: player.totalScore,
                                );
                              },
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defaultSpacing * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _scoreButton(
                            context,
                            'ADD',
                            () => _showAddPlayerDialog(context),
                          ),
                          _scoreButton(
                            context,
                            'RESET',
                            () => _showResetDialog(context),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showAddPlayerDialog(BuildContext context) {
    final controller = TextEditingController();
    final notifier = context.read<ScoreboardNotifier>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Player'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter player name',
          ),
          maxLength: maxPlayerNameLength,
          textCapitalization: TextCapitalization.words,
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: onSecondaryColor,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                notifier.addPlayer(controller.text);
                Navigator.pop(dialogContext);
              }
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: onSecondaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
    final notifier = context.read<ScoreboardNotifier>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset Scoreboard'),
        content: Text(
          style: TextStyle(
            color: onSecondaryColor.withAlpha(217),
            fontSize: 20,
          ),
          'Do you want to reset just the scores or reset everything?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            style: TextButton.styleFrom(
              foregroundColor: onSecondaryColor,
            ),
            child: const Text(
              'Cancel',
            ),
          ),
          TextButton(
            onPressed: () {
              notifier.resetScores();
              Navigator.pop(dialogContext);
            },
            style: TextButton.styleFrom(
              foregroundColor: onSecondaryColor,
            ),
            child: const Text('Reset only scores'),
          ),
          TextButton(
            onPressed: () {
              notifier.clearAll();
              Navigator.pop(dialogContext);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
            child: const Text('Reset players and scores'),
          ),
        ],
      ),
    );
  }

  Widget _scoreButton(
    BuildContext context,
    String label,
    VoidCallback onPressed,
  ) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: onTertiaryColor,
        foregroundColor: onSecondaryColor,
        padding: const EdgeInsets.symmetric(
          horizontal: defaultSpacing * 3,
          vertical: defaultSpacing * 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultRounding),
        ),
      ),
      child: Text(
        style: TextStyle(
          fontSize: 20,
          color: onSecondaryColor,
        ),
        label,
      ),
    );
  }
}
