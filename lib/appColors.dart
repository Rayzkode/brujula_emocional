import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 244, 238, 177);
  static const Color secondaryColor = Color.fromARGB(255, 187, 209, 196);
  static const Color ternaryColor = Color.fromARGB(255, 208, 167, 231);
  static const Color cafeColor = Color.fromARGB(255, 155, 116, 103);

  static LinearGradient get gradientColor => const LinearGradient(
        colors: [
          Color.fromARGB(
              255, 255, 255, 255), // Puedes usar primaryColor si deseas
          Color.fromARGB(
              255, 187, 209, 196), // Puedes usar ternaryColor si deseas
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get gradientColor1 => const LinearGradient(
        colors: [
          Color.fromARGB(
              106, 187, 209, 196), // Puedes usar primaryColor si deseas
          Color.fromARGB(
              255, 255, 191, 252), // Puedes usar ternaryColor si deseas
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get gradientColor2 => const LinearGradient(
        colors: [
          Color.fromARGB(106, 29, 1, 1), // Puedes usar primaryColor si deseas
          Color.fromARGB(
              151, 255, 61, 61), // Puedes usar ternaryColor si deseas
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get gradientColor3 => const LinearGradient(
        colors: [
          Color.fromARGB(
              255, 255, 255, 255), // Puedes usar primaryColor si deseas
          Color.fromARGB(
              255, 255, 238, 0), // Puedes usar ternaryColor si deseas
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
  static LinearGradient get gradientColorBloq => const LinearGradient(
        colors: [
          Color.fromARGB(106, 92, 92, 92), // Puedes usar primaryColor si deseas
          Color.fromARGB(
              120, 252, 252, 252), // Puedes usar ternaryColor si deseas
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
}
