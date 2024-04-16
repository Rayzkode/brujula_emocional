import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

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
