import 'dart:io';

import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/pages_screens/login_page.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  File? _image;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genreController = TextEditingController();
  final _countryController = TextEditingController();

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void signUpUser() async {
    if (passwordConfirmed()) {
      FirebaseAuthMethods(FirebaseAuth.instance).signUpEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }

    if (_image != null) {
      final uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      final referenceRoot = FirebaseStorage.instance.ref();
      final referenceDirImages = referenceRoot.child('images');
      final referenceImageToUpload = referenceDirImages.child(uniqueFileName);

      try {
        await referenceImageToUpload.putFile(_image!);
        final imageUrl = await referenceImageToUpload.getDownloadURL();
        addUserDetails(
            emailController.text.trim(),
            _firstNameController.text.trim(),
            _lastNameController.text.trim(),
            int.parse(_ageController.text.trim()),
            _genreController.text.trim(),
            _countryController.text.trim(),
            imageUrl);
      } catch (e) {
        // Manejo de errores (puedes agregar un mensaje de error aquí)
      }
    } else {
      // Mostrar un mensaje de que no se ha seleccionado alguna imagen
      print('No se ha seleccionado alguna imagen');
    }
  }

  void loginUser() {
    print("Si entra al login");
    FirebaseAuthMethods(FirebaseAuth.instance).loginWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  Future addUserDetails(String email, String firstName, String lastName,
      int age, String genre, String country, String imageUrl) async {
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'first name': firstName,
      'last name': lastName,
      'age': age,
      'genre': genre,
      'country': country,
      'imagen': imageUrl,
    });
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
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
                    'Bienvenido!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Regístrate para comenzar',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  IconButton(
                    onPressed: _selectImage,
                    icon: const Icon(Icons.camera_enhance),
                  ),
                  Center(
                    child: _image == null
                        ? const Text('No se ha seleccionado ninguna imagen')
                        : Image.file(_image!),
                  ),
                  Text("Logo"),
                  const SizedBox(height: 15),
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
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nombre',
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
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Apellido',
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
                          controller: _ageController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Edad',
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
                          controller: _genreController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Genero',
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
                          controller: _countryController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Pais',
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
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Correo',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password textfield
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
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Contraseña',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //confirm password textfield
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
                          obscureText: true,
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirmar contraseña',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //sign up button
                  ElevatedButton(
                    onPressed: () {
                      signUpUser();
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
                      'Registrarse',
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '¿Ya tienes una cuenta? ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Inicia sesion',
                          style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
