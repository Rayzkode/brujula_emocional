import 'package:brujula_emocional/appColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class clinic_page extends StatefulWidget {
  const clinic_page({Key? key, required this.clinicId}) : super(key: key);
  final String clinicId;

  @override
  State<clinic_page> createState() => _clinic_pageState();
}

class _clinic_pageState extends State<clinic_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CLINICA'),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection("clinics")
            .doc(widget.clinicId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al obtener los datos'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(child: Text('El documento no existe'));
          } else {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final nombre = data['nombre'] ?? 'Nombre de la clínica';
            final direccion = data['direccion'] ?? 'Dirección de la clínica';
            final descripcion =
                data['descripcion'] ?? 'Descripcion de la clínica';
            final horarios = data['horarios'] as Map<String, dynamic>;
            final imageUrl = data['imagen'] ?? 'Imagen no disponible';

            // Reorganizar los horarios para que los días se muestren de lunes a domingo
            final List<MapEntry<String, dynamic>> horariosOrdenados = [
              ...horarios.entries.where((entry) => entry.key == 'Lunes'),
              ...horarios.entries.where((entry) => entry.key == 'Martes'),
              ...horarios.entries.where((entry) => entry.key == 'Miércoles'),
              ...horarios.entries.where((entry) => entry.key == 'Jueves'),
              ...horarios.entries.where((entry) => entry.key == 'Viernes'),
              ...horarios.entries.where((entry) => entry.key == 'Sábado'),
              ...horarios.entries.where((entry) => entry.key == 'Domingo'),
            ];

            return Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            fit: BoxFit.cover,
                          )
                        : const Text('No hay imagen disponible'),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20.0, right: 20),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        nombre,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 2),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 50,
                          ),
                          Text(
                            direccion,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              letterSpacing: 1,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                const Text(
                  "HORARIOS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      fontSize: 20),
                ),
                const SizedBox(height: 28),
                // Imprimir los horarios ordenados
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: horariosOrdenados.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: const TextStyle(
                          letterSpacing: 1,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
