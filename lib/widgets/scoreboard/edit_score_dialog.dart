import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rodilo/global_variables.dart';

class EditScoreDialog extends StatefulWidget {
  final int playerIndex;
  final String playerName;
  final int round1Score;
  final int round2Score;
  final int round3Score;
  final Function(int round, int score) onSave;

  const EditScoreDialog({
    super.key,
    required this.playerIndex,
    required this.playerName,
    required this.round1Score,
    required this.round2Score,
    required this.round3Score,
    required this.onSave,
  });

  @override
  State<EditScoreDialog> createState() => _EditScoreDialogState();
}

class _EditScoreDialogState extends State<EditScoreDialog> {
  late TextEditingController _round1Controller;
  late TextEditingController _round2Controller;
  late TextEditingController _round3Controller;

  @override
  void initState() {
    super.initState();
    _round1Controller =
        TextEditingController(text: widget.round1Score.toString());
    _round2Controller =
        TextEditingController(text: widget.round2Score.toString());
    _round3Controller =
        TextEditingController(text: widget.round3Score.toString());
  }

  @override
  void dispose() {
    _round1Controller.dispose();
    _round2Controller.dispose();
    _round3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("${widget.playerName.toUpperCase()}'s score"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: defaultSpacing * 2,
        children: [
          _buildScoreField('1st Round', _round1Controller),
          _buildScoreField('2nd Round', _round2Controller),
          _buildScoreField('3rd Round', _round3Controller),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: onSecondaryColor,
          ),
          child: const Text(
            'Cancel',
          ),
        ),
        TextButton(
          onPressed: () => _saveScores(context),
          style: TextButton.styleFrom(
            foregroundColor: onSecondaryColor,
          ),
          child: const Text(
            'Save',
          ),
        ),
      ],
    );
  }

  Widget _buildScoreField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: '0',
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

  void _saveScores(BuildContext context) {
    final round1 = int.tryParse(_round1Controller.text) ?? 0;
    final round2 = int.tryParse(_round2Controller.text) ?? 0;
    final round3 = int.tryParse(_round3Controller.text) ?? 0;

    widget.onSave(1, round1);
    widget.onSave(2, round2);
    widget.onSave(3, round3);
    Navigator.pop(context);
  }
}
