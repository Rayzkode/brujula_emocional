import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/examns/AnswerCard.dart';
import 'package:brujula_emocional/examns/GDS/GDS_questions.dart';
import 'package:brujula_emocional/examns/ResultScreen.dart';
import 'package:flutter/material.dart';

class GDS_screen extends StatefulWidget {
  const GDS_screen({Key? key}) : super(key: key);

  @override
  State<GDS_screen> createState() => _GDS_screenState();
}

class _GDS_screenState extends State<GDS_screen> {
  List<int?> selectedAnswerIndices = List.filled(questions.length, null);
  int questionIndex = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showWelcomeDialog();
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bienvenido al examen GDS'),
          content: Text(
              'El siguiente examen es un examen avalado y respaldado por especialistas en el area. Te recordamos que los examenes no son un autodiagnostico certificado y respaldado como lo serie el de un profesional. Los examenes que te proporcionamos son una guia, una herramienta la cual te ayudara a tener una nocion de como te encuentras mentalmente'),
          actions: <Widget>[
            TextButton(
              child: Text('Cerrar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void pickAnswer(int value) {
    setState(() {
      selectedAnswerIndices[questionIndex] = value;
    });
  }

  void goToNextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      }
      // Verificar respuesta seleccionada y aumentar puntaje si es correcta
      if (selectedAnswerIndices[questionIndex] ==
          questions[questionIndex].answerIndex) {
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        title: const Text('EXAMEN GDS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.question,
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    pickAnswer(index);
                  },
                  child: AnswerCard(
                    currentdIndex: index,
                    question: question.options[index],
                    isSelected: selectedAnswerIndices[questionIndex] == index,
                    correctAnswerIndex: question.answerIndex,
                    isLastQuestion: isLastQuestion,
                  ),
                );
              },
            ),
            isLastQuestion
                ? ElevatedButton(
                    onPressed: () {
                      // Calcular puntaje final y mostrar pantalla de resultados
                      int finalScore = 0;
                      for (int i = 0; i < selectedAnswerIndices.length; i++) {
                        if (selectedAnswerIndices[i] ==
                            questions[i].answerIndex) {
                          finalScore++;
                        }
                      }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => ResultScreen(score: finalScore)));
                    },
                    child: Text("Terminar"),
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Avanzar a la siguiente pregunta
                      goToNextQuestion();
                    },
                    child: Text("Siguiente"),
                  )
          ],
        ),
      ),
    );
  }
}
