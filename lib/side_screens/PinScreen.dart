/*Esta pantalla te debe dar la opcion como usuario de poder asignarle una
contraseña pin a la app al momento de iniciarla, aqui realmente no se como orientarte,
puedes buscar ejemplos ya sea en apps o en internet*/

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ingresa tu nuevo PIN:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'Ingresa el nuevo PIN',
              ),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para guardar el nuevo PIN
                    final newPin =
                        '1234'; // Ejemplo: aquí deberías obtener el PIN ingresado por el usuario
                    // Guardar el PIN en algún lugar (base de datos, estado global, etc.)
                    // Por ahora, simplemente mostraremos un mensaje:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('¡PIN guardado exitosamente!'),
                      ),
                    );
                  },
                  child: Text('Aceptar'),
                ),
                SizedBox(width: 16),
                TextButton(
                  onPressed: () {
                    // Regresar a la pantalla anterior (por ejemplo, Navigator.pop(context)).
                  },
                  child: Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
