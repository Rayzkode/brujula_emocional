import 'package:brujula_emocional/appColors.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    Key? key,
    required this.question,
    required this.isSelected,
    required this.currentdIndex,
    required this.correctAnswerIndex,
    required bool isLastQuestion,
  }) : super(key: key);

  final String question;
  final bool isSelected;
  final int currentdIndex;
  final int correctAnswerIndex;

  @override
  Widget build(BuildContext context) {
    bool isCorrectAnswer = currentdIndex == correctAnswerIndex;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.white24,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
