import 'package:brujula_emocional/appColors.dart';
import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.secondaryColor,
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "¿Qué te gustaría lograr?",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Elige tus objetivos",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              'assets/images/List.png',
              width: 200,
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
              "• Orientarme sobre mi salud mental",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Mejorar mi estado de ánimo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Aprender a manejar mis emociones",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Trabajar mi inteligencia emocional",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Reducir el estrés y la ansiedad",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Padding(padding: EdgeInsets.all(15)),
            const Text(
              "Elige tu objetivo que más te motive y te guiaremos en el camino hacia el bienestar.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
