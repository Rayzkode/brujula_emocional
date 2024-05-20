import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RespiracionScreen extends StatefulWidget {
  const RespiracionScreen({Key? key}) : super(key: key);

  @override
  _RespiracionScreenState createState() => _RespiracionScreenState();
}

class _RespiracionScreenState extends State<RespiracionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final double _speed = 0.5; // Ajusta esta variable para cambiar la velocidad
  bool _play = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);

    // Mostrar pantalla emergente al iniciar la pantalla
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Bienvenido a la flor de loto'),
            content: Text(
                'En este ejercicio de respiracion, debes coordinar tu respiracion con el movimiento de la flor. cuando cierre inhala y al abrirse  exhala'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _togglePlay(); // Iniciar la animación al cerrar el diálogo
                },
                child: Text('Cerrar'),
              ),
            ],
          );
        },
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlay() {
    setState(() {
      _play = !_play;
      if (_play) {
        _controller.repeat();
      } else {
        _controller.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Respiración'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/animations/Loto.json',
              frameRate: FrameRate(80),
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration * (1 / _speed)
                  ..stop(); // Detener la animación inicialmente
              },
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: _togglePlay,
              icon: _play ? Icon(Icons.pause) : Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
