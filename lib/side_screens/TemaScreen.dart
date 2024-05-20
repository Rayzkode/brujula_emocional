/*Tengo pensado que en esta pantalla puedas cambiar los colores de la aplicacion eligiendo
entre opciones de color ya predeterminados, realmente no tengo la idea completa de como 
hacerla pero si se te ocurre algo adelante, hay total libertad*/

import 'package:flutter/material.dart';

class TemaScreen extends StatelessWidget {
  const TemaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurar Temas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecciona un tema:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildThemeOption(context, 'Tema Azul', Colors.blue),
            _buildThemeOption(context, 'Tema Verde', Colors.green),
            _buildThemeOption(context, 'Tema Morado', Colors.purple),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
      BuildContext context, String themeName, Color color) {
    return ListTile(
      title: Text(themeName),
      trailing: CircleAvatar(
        backgroundColor: color,
        radius: 16,
      ),
      onTap: () {},
    );
  }
}
