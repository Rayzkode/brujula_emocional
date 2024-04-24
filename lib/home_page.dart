import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/pages_screens/clinic_register_screen.dart';
import 'package:brujula_emocional/pages_screens/clinic_screen.dart';
import 'package:brujula_emocional/pages_screens/location_screen.dart';
import 'package:brujula_emocional/pages_screens/profile_screen.dart';
import 'package:brujula_emocional/pages_screens/test_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => const HomePage(),
        '/profile': (BuildContext context) => profile_screen(),
        '/maps': (BuildContext context) => clinic_page(),
        '/clinic_register': (BuildContext context) =>
            const clinic_register(title: 'clinic_register'),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    location_screen(),
    test_screen(),
    profile_screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text(
          'BRUJULA EMOCIONAL',
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.ternaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                        'assets/images/Wizzard.jpg'), // Aquí puedes poner la ruta de la imagen de perfil
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                Navigator.pop(context); // Cierra el cajón lateral primero
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => profile_screen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.text_snippet_rounded),
              title: Text('Resultados'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sunny),
              title: Text('Tema'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Idioma'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('PIN'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuracion'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.perm_device_information_rounded),
              title: Text('Terminos y condiciones'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.add_box_rounded),
              title: Text('Agregar clinica'),
              onTap: () {
                Navigator.pop(context); // Cerrar el cajón lateral primero
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            clinic_register(title: 'clinic_register')));
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.secondaryColor,
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Colors.white,
            ),
            label: 'Inicio',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.text_snippet_rounded,
              color: Colors.white,
            ),
            label: 'Tests',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              color: Colors.white,
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
