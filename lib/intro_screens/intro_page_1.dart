import 'package:brujula_emocional/appColors.dart';
import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 90),
        color: AppColors.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bienvenido",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Brújula Emocional",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Tu guía hacia el bienestar mental",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Image.asset(
              'assets/images/Compass.png',
              width: 230,
            ),
            Padding(padding: EdgeInsets.all(10)),
            const Text(
              "Brújula Emocional te ayuda a comprender tus emociones, tomar el control de tu salud mental y navegar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.justify,
            ),
            const Text(
              "hacia una vida más plena.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.justify,
            ),
          ],
        ));
  }
}
