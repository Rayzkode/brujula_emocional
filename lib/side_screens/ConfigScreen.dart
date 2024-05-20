/*Esta es la pantalla de configuracion
En esta pantalla se deben mostrar campos a los cuales el usuario puede acceder para configurar
asi como:
-PERFIL
-IDIOMAS
-APARTADO LEGAL
-PRIVACIDAD
-ACERCA DE LA APP
-Y POR EJEMPLO CERRAR SESION

Estos puntos realmente son botones que te llevan a otras pantallas pero con que se vean 
esta bien o sea que solo sea estetico

Estos puntos son defaults, puedes consultar pantallas de configuracion de apps que tengas
en tu celular, yo por ejemplo revise la de didi food para darme una idea de que puede 
llevar la pantalla de configuracion*/

import 'package:flutter/material.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: ListView(
        children: [
          _buildConfigItem(context, 'Perfil', Icons.person),
          _buildConfigItem(context, 'Idiomas', Icons.language),
          _buildConfigItem(context, 'Apartado Legal', Icons.gavel),
          _buildConfigItem(context, 'Privacidad', Icons.lock),
          _buildConfigItem(context, 'Acerca de la App', Icons.info),
          _buildConfigItem(context, 'Cerrar Sesión', Icons.logout),
        ],
      ),
    );
  }

  Widget _buildConfigItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        //* Aquí se navegaría a la pantalla correspondiente según el ítem seleccionado ?)
      },
    );
  }
}
