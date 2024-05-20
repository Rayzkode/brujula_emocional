import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/pages_screens/WelcomeScreen.dart';
import 'package:brujula_emocional/pages_screens/login_page.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:brujula_emocional/side_screens/ConfigScreen.dart';
import 'package:brujula_emocional/side_screens/PinScreen.dart';
import 'package:brujula_emocional/side_screens/TemaScreen.dart';
import 'package:brujula_emocional/side_screens/TermsScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pages_screens/clinic_page.dart';
import 'pages_screens/clinic_register_screen.dart';
import 'pages_screens/location_screen.dart';
import 'pages_screens/profile_screen.dart';
import 'pages_screens/test_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.secondaryColor,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/welcome': (context) => const WelcomeScreen(),
        '/profile': (context) => profile_screen(),
        '/maps': (context) => LocationScreen(),
        '/clinic_register': (context) =>
            const clinic_register(title: 'clinic_register'),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const WelcomeScreen(),
    test_screen(),
    LocationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<User?>(); // Obtener el usuario

    if (user != null) {
      final _email = user.email;

      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.secondaryColor,
          actions: [
            FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection("users")
                  .where('email', isEqualTo: _email)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  if (snapshot.hasError) {
                    return const Text('Error al obtener los datos');
                  } else {
                    final data = snapshot.data!.docs;
                    final imageUrl = data.isNotEmpty ? data[0]['imagen'] : null;

                    return Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              // Mostrar el diálogo emergente al presionar la imagen
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'No estas solo/a',
                                      style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Si estás experimentando una crisis emocional, estamos aqui para ti, estamos aquí para ayudarte.',
                                            style: GoogleFonts.lato(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'Linea de la vida: ',
                                            style: GoogleFonts.lato(
                                                fontSize: 16.0),
                                          ),
                                          const SizedBox(height: 10),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 226, 237, 230),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 15),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              elevation: 8,
                                            ),
                                            onPressed: () async {
                                              final Uri url = Uri(
                                                  scheme: 'tel',
                                                  path: "800 911 2000");
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url);
                                              } else {
                                                "No se pudo";
                                              }
                                            },
                                            child: const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Icon(Icons.phone),
                                                Text('800 911 2000'),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            'En la Línea de la Vida un grupo de especialistas en atención a la salud que te escucha y brinda apoyo emocional a las personas que lo requieren y a que reciban un tratamiento adecuado durante las 24 horas de los 365 días del año.',
                                            style: GoogleFonts.lato(
                                                fontSize: 15.0),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Tu seguridad y bienestar son lo más importante.",
                                            style: GoogleFonts.lato(
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.justify,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Estamos contigo",
                                            style: GoogleFonts.lato(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "-Respira profundamente: La respiración profunda puede ayudarte a calmarte y a reducir la ansiedad.",
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "-Encuentra un lugar seguro: Si te sientes abrumado/a, busca un lugar tranquilo donde puedas estar solo/a.",
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "-Habla con alguien de confianza: Compartir lo que estás sintiendo con un amigo, familiar o terapeuta puede ayudarte a sentirte mejor.",
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "-Haz algo que te relaje: Escuchar música, leer un libro o tomar un baño caliente pueden ayudarte a calmarte.",
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            "Recuerda que no estás solo/a: Hay muchas personas que han pasado por crisis y han salido adelante.",
                                            style: GoogleFonts.lato(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Cerrar el diálogo
                                        },
                                        child: const Text('Cerrar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Image.asset("assets/images/flotador.jpg")),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: imageUrl != null
                                ? Image.network(imageUrl).image
                                : const AssetImage(
                                    "assets/images/usuarioDefault.png"),
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                ),
                child: ProfileHeader(),
              ),
              ..._buildDrawerList(context),
            ],
          ),
        ),
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.secondaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, color: Colors.white),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_snippet_rounded, color: Colors.white),
              label: 'Tests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital, color: Colors.white),
              label: 'Clinicas',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      );
    } else {
      return const LoginPage();
    }
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    return [
      _buildDrawerItem(
        icon: Icons.person,
        title: 'Perfil',
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => profile_screen())),
      ),
      _buildDrawerItem(
        icon: Icons.home,
        title: 'Inicio',
        onTap: () => Navigator.pop(context),
      ),
      _buildDrawerItem(
        icon: Icons.text_snippet_rounded,
        title: 'Resultados',
        onTap: () => Navigator.pop(context),
      ),
      _buildDrawerItem(
        icon: Icons.sunny,
        title: 'Tema',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TemaScreen())),
      ),
      _buildDrawerItem(
        icon: Icons.lock,
        title: 'PIN',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PinScreen())),
      ),
      _buildDrawerItem(
        icon: Icons.settings,
        title: 'Configuracion',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ConfigScreen())),
      ),
      _buildDrawerItem(
        icon: Icons.perm_device_information_rounded,
        title: 'Terminos y condiciones',
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TermsScreen())),
      ),
      _buildDrawerItem(
        icon: Icons.add_box_rounded,
        title: 'Agregar clinica',
        onTap: () {
          Navigator.pop(context); // Cerrar el cajón lateral primero
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const clinic_register(title: 'clinic_register')));
        },
      ),
    ];
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final email = user.email;

    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("users")
            .where('email', isEqualTo: email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.hasError) {
              return const Text('Error al obtener los datos');
            } else {
              final data = snapshot.data!.docs;
              final imageUrl = data.isNotEmpty ? data[0]['imagen'] : null;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: imageUrl != null
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ).image
                          : const AssetImage(
                              "assets/images/usuarioDefault.jpg")),
                  const SizedBox(height: 10),
                  Text(
                    data.isNotEmpty ? data[0]['first name'] : 'Nombre',
                    style: const TextStyle(
                      letterSpacing: 1,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
