import 'package:animated_background/animated_background.dart';
import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class RelaxScreen extends StatefulWidget {
  const RelaxScreen({super.key});

  @override
  State<RelaxScreen> createState() => _RelaxScreenState();
}

class _RelaxScreenState extends State<RelaxScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final _email = user.email;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/FondoOscuro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("users")
                      .where('email', isEqualTo: _email)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: [
                          Center(
                            child: Lottie.asset(
                              'assets/animations/Compass.json',
                              fit: BoxFit.contain,
                              repeat: true,
                            ),
                          ),
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
                              padding: const EdgeInsets.all(30),
                              child: ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return const LinearGradient(
                                    colors: [
                                      Color.fromARGB(177, 186, 167,
                                          255), // Puedes usar primaryColor si deseas
                                      Color.fromARGB(255, 250, 198, 198),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    tileMode: TileMode.clamp,
                                  ).createShader(bounds);
                                },
                                child: Text(
                                  data.isNotEmpty
                                      ? "Bienvenido a tu espacio, ${data[0]['first name']}"
                                      : 'Ser vivo',
                                  style: GoogleFonts.playfairDisplay(
                                    letterSpacing: 1,
                                    color: Colors
                                        .white, // El color del texto es blanco ya que el gradiente se aplicará mediante ShaderMask
                                    fontSize: 45,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *
                                  0.6, // Ajustar la altura según sea necesario
                              child: AnimatedBackground(
                                behaviour: RandomParticleBehaviour(
                                  options: const ParticleOptions(
                                    spawnMaxRadius: 1,
                                    spawnMinSpeed: 5,
                                    particleCount: 40,
                                    spawnMaxSpeed: 10,
                                    spawnOpacity: 0.2,
                                    minOpacity: 0.2,
                                    baseColor:
                                        Color.fromARGB(183, 255, 255, 255),
                                  ),
                                ),
                                vsync: this,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              gradient: AppColors.gradientColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 8,
                                              ),
                                              onPressed: () {
                                                // Acción del botón
                                              },
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'Volver al presente',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  Lottie.asset(
                                                      "assets/animations/Astronauta.json",
                                                      width: 90)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              gradient: AppColors.gradientColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 8,
                                              ),
                                              onPressed: () {
                                                // Acción del botón
                                              },
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'Respira',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  Lottie.asset(
                                                      "assets/animations/Respiracion.json",
                                                      width: 90)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              gradient: AppColors.gradientColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 8,
                                              ),
                                              onPressed: () {
                                                // Acción del botón
                                              },
                                              child: const Text('Botón Fijo'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              gradient:
                                                  AppColors.gradientColor3,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.all(5),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 8,
                                              ),
                                              onPressed: () {
                                                // Acción del botón
                                              },
                                              child: Column(
                                                children: [
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    'Activa tus sentidos',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white),
                                                  ),
                                                  Lottie.asset(
                                                      "assets/animations/BestMandala.json",
                                                      width: 90,
                                                      frameRate: FrameRate(60))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              gradient: AppColors.gradientColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 40),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                elevation: 8,
                                              ),
                                              onPressed: () {
                                                // Acción del botón
                                              },
                                              child: const Text('Botón Fijo'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
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
      ),
    );
  }
}
