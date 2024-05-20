/*Esta pantalla es de terminos y condiciones realmente es puro texto y puedes 
inventarle lo que quieras mientras se vea bien, de nuevo apoyate de aplicaciones
que tengan esta opcion para una mejor guia*/

import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Términos y Condiciones'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TÉRMINOS Y CONDICIONES DE USO',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Bienvenido a Brújula Emocional. Al utilizar esta aplicación, aceptas los siguientes términos y condiciones:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '1. Uso Responsable:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- Brújula Emocional es una herramienta de apoyo y no reemplaza la atención médica profesional.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- Utilízala de manera responsable y consulta a un especialista si necesitas ayuda.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '2. Privacidad:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- Respetamos tu privacidad. No compartiremos tus datos personales con terceros sin tu consentimiento.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '3. Contenido:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- El contenido proporcionado en Brújula Emocional es informativo y educativo.',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                '- No constituye asesoramiento médico o psicológico.',
                style: const TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                '4. Cambios en los Términos:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '- Nos reservamos el derecho de modificar estos términos en cualquier momento.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 24),
              Text(
                '¡Gracias por usar Brújula Emocional!',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
