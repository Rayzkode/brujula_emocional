import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/pages_screens/clinic_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetClinicData extends StatelessWidget {
  GetClinicData({required this.documentId});
  final String documentId;

  @override
  Widget build(BuildContext context) {
    CollectionReference clinic =
        FirebaseFirestore.instance.collection("clinics");

    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;

          // Verificar si el campo 'logo' está presente y no es nulo
          if (data != null) {
            final logoUrl = data['logo'];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => clinic_page(clinicId: documentId),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['nombre'],
                            style: GoogleFonts.lato(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Color.fromARGB(0, 255, 255, 255),
                        backgroundImage: logoUrl != null
                            ? Image.network(logoUrl).image
                            : AssetImage("assets/images/clinicaDefault.png"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Si el campo 'logo' está ausente o es nulo, puedes mostrar un mensaje o un widget alternativo
            return Text('No se encontró la imagen del logo');
          }
        }
        return Text('CARGANDO...');
      }),
      future: clinic.doc(documentId).get(),
    );
  }
}
