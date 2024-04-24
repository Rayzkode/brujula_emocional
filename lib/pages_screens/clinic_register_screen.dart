import 'dart:io';

import 'package:brujula_emocional/appColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class clinic_register extends StatefulWidget {
  const clinic_register({super.key, required this.title});
  final String title;

  @override
  State<clinic_register> createState() => _clinic_registerState();
}

class _clinic_registerState extends State<clinic_register> {
  File? _image;
  String imageUrl = '';
  final _nombreController = TextEditingController();
  final _direccionController = TextEditingController();
  final _horarioController = TextEditingController();
  final _planController = TextEditingController();
  final _tratamientosController = TextEditingController();
  final _imagenController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _direccionController.dispose();
    _horarioController.dispose();
    _planController.dispose();
    _tratamientosController.dispose();
    _imagenController.dispose();
  }

  void registerClinic() async {
    addClinicDetails(
      _nombreController.text.trim(),
      _direccionController.text.trim(),
      _horarioController.text.trim(),
      _planController.text.trim(),
      _tratamientosController.text.trim(),
      imageUrl.trim(),
    );
  }

  Future addClinicDetails(String nombre, String direccion, String horario,
      String plan, String tratamientos, String imagen) async {
    await FirebaseFirestore.instance.collection('clinics').add({
      'nombre': nombre,
      'direccion': direccion,
      'horario': horario,
      'plan': plan,
      'tratamientos': tratamientos,
      'imagen': imagen,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BRUJULA EMOCIONAL',
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 2,
                vertical: MediaQuery.of(context).size.height * 0.01),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Compass.png',
                    width: 120,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //hello again
                  const Text(
                    'Registro de clinica',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  //email textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 244, 244, 244),
                        border: Border.all(color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _nombreController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nombre de la clinica',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 244, 244, 244),
                        border: Border.all(color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _direccionController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Direccion',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 244, 244, 244),
                        border: Border.all(color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _horarioController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Horario',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 244, 244, 244),
                        border: Border.all(color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _planController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Planes',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(144, 244, 244, 244),
                        border: Border.all(color: AppColors.secondaryColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _tratamientosController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Tratamientos',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IconButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        print('${file?.path}');

                        setState(() {
                          if (file != null) {
                            _image = File(file.path);
                          }
                        });
                      },
                      icon: Icon(Icons.camera_enhance)),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: _image == null
                        ? Text('No Image selected')
                        : Image.file(_image!),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (_image != null) {
                        // Subida de la imagen al almacenamiento en la nube
                        String uniqueFileName =
                            DateTime.now().millisecondsSinceEpoch.toString();
                        Reference referenceRoot =
                            FirebaseStorage.instance.ref();
                        Reference referenceDirImages =
                            referenceRoot.child('images');
                        Reference referenceImageToUpload =
                            referenceDirImages.child('${uniqueFileName}');

                        try {
                          await referenceImageToUpload.putFile(_image!);
                          imageUrl =
                              await referenceImageToUpload.getDownloadURL();
                          // Llamar a la función para registrar la clínica después de subir la imagen
                          registerClinic();
                        } catch (e) {
                          // Manejo de errores (puedes agregar un mensaje de error aquí)
                        }
                      } else {
                        // Mostrar un mensaje de que no se ha seleccionado ninguna imagen
                        print('No se ha seleccionado ninguna imagen');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 20),
                      backgroundColor: AppColors.secondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Registrar clinica',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
