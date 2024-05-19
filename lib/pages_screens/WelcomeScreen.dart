import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/examns/GDS/GDS_screen.dart';
import 'package:brujula_emocional/pages_screens/RelaxScreen.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final _email = user.email;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/images/fondo.png"))),
        child: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection("users")
                    .where('email', isEqualTo: _email)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                            child: Lottie.asset(
                                'assets/animations/Compass.json',
                                fit: BoxFit.contain,
                                repeat: true)),
                      ],
                    );
                  } else {
                    if (snapshot.hasError) {
                      return const Text('Error al obtener los datos');
                    } else {
                      final data = snapshot.data!.docs;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 20, right: 20),
                            child: Text(
                              data.isNotEmpty
                                  ? "Buenas noches, ${data[0]['first name']}"
                                  : 'Nombre',
                              style: GoogleFonts.playfairDisplay(
                                letterSpacing: 1,
                                color: Color.fromARGB(255, 111, 59, 42),
                                fontSize: 45,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 60, left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Mi diario",
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          "Redacta tu dia",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("assets/images/inicio3.jpg"),
                                    fit: BoxFit.cover,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 60, left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GDS_screen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Escala de Depresión Geriátrica",
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          "Evalua tu nivel de depresion",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("assets/images/inicio1.png"),
                                    fit: BoxFit.cover,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 60, left: 20, right: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RelaxScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                          "A relajarnos",
                                          style: GoogleFonts.lato(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                        Text(
                                          "Relaja tus niveles de estres",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("assets/images/inicio2.png"),
                                    fit: BoxFit.cover,
                                    width: 100,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
