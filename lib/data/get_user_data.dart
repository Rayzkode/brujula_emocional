import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserData extends StatelessWidget {
  final String documentId;

  GetUserData({required this.documentId});

  @override
  Widget build(BuildContext context) {
    //Get collection
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('First Name: ${data['first name']}');
        }
        return Text('Cargando...');
      }),
      future: users.doc(documentId).get(),
    );
  }
}
