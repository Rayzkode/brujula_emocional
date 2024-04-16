import 'package:brujula_emocional/appColors.dart';
import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.ternaryColor,
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Como funciona?",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Descubre las herramientas que te ofrecemos",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              'assets/images/talk.png',
              width: 200,
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
              "• Conexión con especialistas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Recursos de autoayuda",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Ejercicios prácticos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            const Text(
              "• Tests de evaluación emocional",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Padding(padding: EdgeInsets.all(8)),
            const Text(
              "Brújula Emocional te ofrece una variedad de herramientas para ayudarte a alcanzar tus objetivos de bienestar mental.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
