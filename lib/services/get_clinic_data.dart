import 'package:brujula_emocional/pages_screens/clinic_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            clinic_page(clinicId: documentId)));
              },
              child: Row(
                children: [
                  Text(data['nombre']),
                ],
              ));
        }
        return Text('CARGANDO...');
      }),
      future: clinic.doc(documentId).get(),
    );
  }
}
