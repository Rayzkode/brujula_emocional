import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/ejercicios/PresenteQuestion.dart';
import 'package:brujula_emocional/examns/AnswerCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PresenteScreen extends StatefulWidget {
  const PresenteScreen({Key? key}) : super(key: key);

  @override
  _PresenteScreenState createState() => _PresenteScreenState();
}

class _PresenteScreenState extends State<PresenteScreen> {
  // Inicialmente, el usuario puede agregar hasta 5 respuestas para la primera pregunta
  List<int> numPreguntas = [5];
  final List<List<String>> userAnswers =
      List.generate(questions.length, (_) => <String>[]);
  final TextEditingController _controller = TextEditingController();
  int questionIndex = 0;

  void addAnswer() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        userAnswers[questionIndex].add(_controller.text);
        _controller.clear();

        // Verificar si se han agregado suficientes respuestas para la pregunta actual
        if (userAnswers[questionIndex].length == numPreguntas[questionIndex]) {
          goToNextQuestion();
        }
      }
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
        // Reducir el número de respuestas permitidas en 1 para la siguiente pregunta
        if (numPreguntas.length <= questionIndex) {
          numPreguntas.add(numPreguntas[questionIndex - 1] - 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text(
                  "Vuelve a tu presente",
                  style: GoogleFonts.playfairDisplay(
                    letterSpacing: 1,
                    color: Color.fromARGB(255, 111, 59, 42),
                    fontSize: 45,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  question.question,
                  style: TextStyle(fontSize: 21),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Escribe tu respuesta aquí',
                ),
                maxLines: null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addAnswer,
                child: const Text('Añadir respuesta'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: userAnswers[questionIndex].length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        userAnswers[questionIndex][index],
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
