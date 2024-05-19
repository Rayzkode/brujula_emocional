import 'package:brujula_emocional/pages_screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class profile_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    final _email = user.email;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          _buildProfileDetails(context, _email!),
          _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildProfileDetails(BuildContext context, String email) {
    return FutureBuilder<QuerySnapshot>(
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: Text(
                    "Perfil",
                    style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 1.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.ternaryColor, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: imageUrl != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(imageUrl),
                          )
                        : const DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/usuarioDefault.jpg"),
                          ),
                  ),
                ),
                Container(
                  height: 450,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildProfileText(data, 'email', 'Email'),
                      _buildProfileText(data, 'first name', 'Nombre'),
                      _buildProfileText(data, 'age', 'Edad'),
                      _buildProfileText(data, 'genre', 'Genero'),
                      _buildSignOutButton(context),
                    ],
                  ),
                )
              ],
            );
          }
        }
      },
    );
  }

  Widget _buildProfileText(List<QueryDocumentSnapshot<Object?>> data,
      String fieldName, String placeholder) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 90),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.ternaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        data.isNotEmpty ? data[0][fieldName].toString() : placeholder,
        style: const TextStyle(
            letterSpacing: 1,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await context.read<FirebaseAuthMethods>().signOut(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false,
        );
      },
      child: const Text(
        'Sign out',
        style: TextStyle(
          color: AppColors.ternaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 270, left: 184),
      child: CircleAvatar(
        backgroundColor: Colors.black54,
        child: IconButton(
          icon: const Icon(
            Icons.edit,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.ternaryColor;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
