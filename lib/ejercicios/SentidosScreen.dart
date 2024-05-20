import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SentidosScreen extends StatefulWidget {
  const SentidosScreen({super.key});

  @override
  _SentidosScreenState createState() => _SentidosScreenState();
}

class _SentidosScreenState extends State<SentidosScreen> {
  // Variables de opacidad para cada texto
  double _opacity1 = 0.0;
  double _opacity2 = 0.0;
  double _opacity3 = 0.0;

  @override
  void initState() {
    super.initState();
    _animateTexts();
  }

  void _animateTexts() {
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        _opacity1 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 3000), () {
      setState(() {
        _opacity2 = 1.0;
      });
    });
    Future.delayed(Duration(milliseconds: 4000), () {
      setState(() {
        _opacity3 = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  "Activa tus sentidos",
                  style: GoogleFonts.playfairDisplay(
                    letterSpacing: 1,
                    color: Color.fromARGB(255, 111, 59, 42),
                    fontSize: 45,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacity1,
                duration: Duration(seconds: 1),
                child: Text(
                  "1.- Coloca tus palmas juntas y presiona fuertemente una contra la otra",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity2,
                duration: Duration(seconds: 1),
                child: Text(
                  "2.- Manten esta postura durante quince segundos",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity3,
                duration: Duration(seconds: 1),
                child: Text(
                  "3.- Relaja tus manos y pon atencion a la sensacion que esto provo",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
