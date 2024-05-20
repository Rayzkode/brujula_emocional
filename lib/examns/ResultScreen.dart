import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/examns/GDS/GDS_questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Text(
                "Resultados",
                style: GoogleFonts.playfairDisplay(
                  letterSpacing: 1,
                  color: const Color.fromARGB(255, 111, 59, 42),
                  fontSize: 45,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "Tu puntuacion ha sido de: ${score.toString()}",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "La interpretacion del examen es la siguiente: ",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            if (score <= 4)
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "Es un resultado normal, sin sintomas depresivos.",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
            if (score >= 5 && score <= 8)
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  children: [
                    Text(
                      "Indica la presencia de sintomas depresivos leves",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Te recomendamos acercarte por apoyo, no solo a psicologos, a tu familia y amigos que puedan apoyarte y escucharte",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            if (score >= 9 && score <= 10)
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Indica la presencia de sintomas depresivos moderados",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Te recomendamos acercarte a psicologos y especialistas para un apoyo centrado y enfocado, de igual manera la cercania a familia y amigos personas que esten contigo para apoyarte",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            if (score >= 11 && score <= 15)
              const Padding(
                padding: EdgeInsets.only(left: 50, right: 50),
                child: Text(
                  "No te mates manito",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
