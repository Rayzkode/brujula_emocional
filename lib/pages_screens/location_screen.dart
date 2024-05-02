import 'package:brujula_emocional/services/get_clinic_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  List<String> docIDs = [];

  @override
  void initState() {
    super.initState();
    getDocId();
  }

  Future<void> getDocId() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('clinics').get();
    setState(() {
      docIDs = querySnapshot.docs.map((doc) => doc.id).toList();
    });
  }

  Future<void> _refreshData() async {
    await getDocId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: GetClinicData(
                        documentId: docIDs[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
