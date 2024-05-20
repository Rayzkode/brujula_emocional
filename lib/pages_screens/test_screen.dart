import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/examns/GDS/GDS_screen.dart';
import 'package:flutter/material.dart';

class test_screen extends StatefulWidget {
  @override
  _test_screenState createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/FondoBlnaco.png"))),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 600),
                opacity: _opacity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GDS_screen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .secondaryColor, // Cambia el color de fondo del botón
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Cambia el color del texto del botón
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 40), // Ajusta el padding del botón
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10)), // Aplica un borde redondeado al botón
                    elevation: 8, // Cambia la elevación del botón
                  ),
                  child: const Text(
                    "Escala de Depresión Geriátrica",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1100),
                opacity: _opacity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .secondaryColor, // Cambia el color de fondo del botón
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Cambia el color del texto del botón
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 40), // Ajusta el padding del botón
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10)), // Aplica un borde redondeado al botón
                    elevation: 8, // Cambia la elevación del botón
                  ),
                  child: const Text(
                    "BDI (Escala de depresion de Beck)",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1700),
                opacity: _opacity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .secondaryColor, // Cambia el color de fondo del botón
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20), // Cambia el color del texto del botón
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 40), // Ajusta el padding del botón
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10)), // Aplica un borde redondeado al botón
                    elevation: 8, // Cambia la elevación del botón
                  ),
                  child: const Text(
                    "EXAMEN BLOQUEADO",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
