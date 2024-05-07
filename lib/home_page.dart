import 'package:brujula_emocional/appColors.dart';
import 'package:flutter/material.dart';

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
    LocationScreen(),
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
        backgroundColor: AppColors.secondaryColor,
        title: const Text('BRUJULA EMOCIONAL'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.ternaryColor,
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
            icon: Icon(Icons.person_rounded, color: Colors.white),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> _buildDrawerList(BuildContext context) {
    return [
      _buildDrawerItem(
        icon: Icons.person,
        title: 'Perfil',
        onTap: () => Navigator.pushNamed(context, '/profile'),
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
        onTap: () => Navigator.pop(context),
      ),
      _buildDrawerItem(
        icon: Icons.lock,
        title: 'PIN',
        onTap: () => Navigator.pop(context),
      ),
      _buildDrawerItem(
        icon: Icons.settings,
        title: 'Configuracion',
        onTap: () => Navigator.pop(context),
      ),
      _buildDrawerItem(
        icon: Icons.perm_device_information_rounded,
        title: 'Terminos y condiciones',
        onTap: () => Navigator.pop(context),
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
                      clinic_register(title: 'clinic_register')));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: const AssetImage('assets/images/Wizzard.jpg'),
        ),
        const SizedBox(height: 10),
        const Text(
          'Username',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
