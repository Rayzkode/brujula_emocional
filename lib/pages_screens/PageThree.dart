import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brujula_emocional/appColors.dart';
import 'package:brujula_emocional/services/firebase_auth_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class PageThree extends StatelessWidget {
  Widget textField({required String hintText}) {
    return Material(
      elevation: 4,
      shadowColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                letterSpacing: 2,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
            fillColor: Colors.white30,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }

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
          FutureBuilder<QuerySnapshot>(
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

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 450,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    15), // Bordes redondeados
                              ),
                              child: Text(
                                data.isNotEmpty ? data[0]['email'] : 'Email',
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 90),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: AppColors
                                        .ternaryColor), // Color del borde
                                borderRadius: BorderRadius.circular(
                                    15), // Bordes redondeados
                              ),
                              child: Text(
                                data.isNotEmpty
                                    ? data[0]['first name']
                                    : 'Nombre',
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 90),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: AppColors
                                        .ternaryColor), // Color del borde
                                borderRadius: BorderRadius.circular(
                                    15), // Bordes redondeados
                              ),
                              child: Text(
                                data.isNotEmpty
                                    ? data[0]['age'].toString()
                                    : 'edad',
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 24, horizontal: 90),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: AppColors
                                        .ternaryColor), // Color del borde
                                borderRadius: BorderRadius.circular(
                                    15), // Bordes redondeados
                              ),
                              child: Text(
                                data.isNotEmpty ? data[0]['genre'] : 'Genero',
                                style: const TextStyle(
                                    letterSpacing: 1,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<FirebaseAuthMethods>()
                                    .signOut(context);
                              },
                              child: const Text(
                                'Sign out',
                                style: TextStyle(
                                  color: AppColors.ternaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              }
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
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
                    border: Border.all(color: Colors.white, width: 5),
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/Wizzard.jpg"))),
              ),
            ],
          ),
          Padding(
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
          )
        ],
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
