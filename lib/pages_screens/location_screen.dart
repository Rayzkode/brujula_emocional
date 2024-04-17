import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/pages_screens/clinic_screen.dart';
import 'package:flutter/material.dart';

class location_screen extends StatelessWidget {
  const location_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  10), // Hace que el contenedor tenga forma circular
              color: const Color.fromARGB(
                  156, 158, 158, 158), // Color de fondo del contenedor
            ),
            width: MediaQuery.of(context).size.width * .9,
            height: 6 * 21,
            child: Container(
              child:
                  // Expanded(flex: 2, child: Image.asset("assets/images/maps.png")),
                  ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return clinic_page();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  backgroundColor: AppColors.ternaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Clinica',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              //Fin del boton----------
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  10), // Hace que el contenedor tenga forma circular
              color: const Color.fromARGB(
                  156, 158, 158, 158), // Color de fondo del contenedor
            ),
            width: MediaQuery.of(context).size.width * .9,
            height: 6 * 21,
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset("assets/images/maps.png")),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Clinica tal",
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  10), // Hace que el contenedor tenga forma circular
              color: const Color.fromARGB(
                  156, 158, 158, 158), // Color de fondo del contenedor
            ),
            width: MediaQuery.of(context).size.width * .9,
            height: 6 * 21,
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset("assets/images/maps.png")),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Clinica tal",
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.all(7)),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  10), // Hace que el contenedor tenga forma circular
              color: const Color.fromARGB(
                  156, 158, 158, 158), // Color de fondo del contenedor
            ),
            width: MediaQuery.of(context).size.width * .9,
            height: 6 * 21,
            child: Row(
              children: [
                Expanded(flex: 2, child: Image.asset("assets/images/maps.png")),
                Expanded(
                    flex: 2,
                    child: Text(
                      "Clinica tal",
                      style: TextStyle(fontSize: 30),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
