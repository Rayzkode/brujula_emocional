import 'dart:io';

import 'package:brujula_emocional/appColors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class clinic_register extends StatefulWidget {
  const clinic_register({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<clinic_register> createState() => _clinic_registerState();
}

class _clinic_registerState extends State<clinic_register> {
  File? _image;
  File? _logo;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _serviciosController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _redesController = TextEditingController();

  Map<String, String> _horarios = {
    "Lunes": "",
    "Martes": "",
    "Miércoles": "",
    "Jueves": "",
    "Viernes": "",
    "Sábado": "",
    "Domingo": "",
  };

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _selectLogo() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _logo = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_image != null && _logo != null) {
      final uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      final referenceRoot = FirebaseStorage.instance.ref();
      final referenceDirImages = referenceRoot.child('images');
      final referenceImageToUpload = referenceDirImages.child(uniqueFileName);

      final uniqueFileNameLogo =
          DateTime.now().millisecondsSinceEpoch.toString();
      final referenceRootLogo = FirebaseStorage.instance.ref();
      final referenceDirImagesLogo = referenceRootLogo.child('images');
      final referenceImageToUploadLogo =
          referenceDirImagesLogo.child(uniqueFileNameLogo);

      try {
        await referenceImageToUpload.putFile(_image!);
        await referenceImageToUploadLogo.putFile(_logo!);
        final imageUrl = await referenceImageToUpload.getDownloadURL();
        final logoUrl = await referenceImageToUploadLogo.getDownloadURL();
        _registerClinic(imageUrl, logoUrl);
      } catch (e) {
        // Manejo de errores (puedes agregar un mensaje de error aquí)
      }
    } else {
      // Mostrar un mensaje de que no se ha seleccionado alguna imagen
      print('No se ha seleccionado alguna imagen');
    }
  }

  void _registerClinic(String imageUrl, String logoUrl) async {
    await FirebaseFirestore.instance.collection('clinics').add({
      'nombre': _nombreController.text.trim(),
      'direccion': _direccionController.text.trim(),
      'horarios': _horarios,
      'sector': _sectorController.text.trim(),
      'servicios': _serviciosController.text.trim(),
      'descripcion': _descripcionController.text.trim(),
      'telefono': _telefonoController.text.trim(),
      'redes': _redesController.text.trim(),
      'imagen': imageUrl,
      'logo': logoUrl
    });

    // Limpiar los controladores de texto después de registrar la clínica
    _nombreController.clear();
    _direccionController.clear();
    _sectorController.clear();
    _serviciosController.clear();
    _descripcionController.clear();
    _telefonoController.clear();
    _redesController.clear();
    setState(() {
      _image = null;
      _logo = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BRUJULA EMOCIONAL'),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Compass.png',
                  width: 120,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Registro de clínica',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: _selectLogo,
                  icon: const Icon(Icons.camera_enhance),
                ),
                Center(
                  child: _logo == null
                      ? const Text('No se ha seleccionado ninguna imagen')
                      : Image.file(_logo!),
                ),
                Text("Logo"),
                const SizedBox(height: 15),

                // TextFields
                ..._buildTextFields(),
                const SizedBox(height: 10),
                // ExpansionTile para los horarios
                ExpansionTile(
                  title: const Text('Horarios'),
                  children: [_buildHorariosInput()],
                ),
                const SizedBox(height: 10),
                // Image Picker
                IconButton(
                  onPressed: _selectImage,
                  icon: const Icon(Icons.camera_enhance),
                ),
                const SizedBox(height: 10),
                // Image Preview
                Center(
                  child: _image == null
                      ? const Text('No se ha seleccionado ninguna imagen')
                      : Image.file(_image!),
                ),
                const SizedBox(height: 10),
                // Register Button
                ElevatedButton(
                  onPressed: _uploadImage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 20),
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Registrar clínica',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      _buildTextField(_nombreController, 'Nombre de la clínica',
          'Ingrese el nombre de la clínica'),
      _buildTextField(_direccionController, 'Dirección',
          'Ingrese la dirección de la clínica'),
      _buildTextField(_sectorController, 'Sector',
          'Ingrese el sector al que va dirigida la clínica'),
      _buildTextField(_serviciosController, 'Servicios',
          'Ingrese los servicios de la clínica'),
      _buildTextField(_descripcionController, 'Descripcion',
          'Ingrese una descripcion de la clínica'),
      _buildTextField(_telefonoController, 'Telefono',
          'Ingrese un numero de telefono de la clínica'),
      _buildTextField(
          _redesController, 'Pagina', 'Ingrese unad pagina de la clínica'),
    ];
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingrese $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildHorariosInput() {
    return Column(
      children: _horarios.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 6),
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5.0, vertical: 6),
                child: Text(entry.key),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Ingrese el horario',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _horarios[entry.key] = value;
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
