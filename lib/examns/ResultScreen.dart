import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/examns/GDS/GDS_questions.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                "Hola nombre tu puntuacion ha sido: ${score.toString()}",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
            ),
            if (score <= 4)
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Tas sanito",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            if (score >= 5 && score <= 8)
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Andas levesillo",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            if (score >= 9 && score <= 10)
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Moderadamente depresivo pa",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            if (score >= 11 && score <= 15)
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "No te mates manito",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / 9,
                    color: AppColors.ternaryColor,
                    backgroundColor: AppColors.secondaryColor,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString(),
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Text('${(score / questions.length * 100).round()}%',
                        style: TextStyle(fontSize: 25)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
