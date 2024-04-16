import 'package:brujula_emocional/home_page.dart';
import 'package:brujula_emocional/intro_screens/intro_page_1.dart';
import 'package:brujula_emocional/intro_screens/intro_page_2.dart';
import 'package:brujula_emocional/intro_screens/intro_page_3.dart';
import 'package:brujula_emocional/pages_screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          //Indicacion de puntos
          Container(
              alignment: Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //skip
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                        dotColor: Colors.white,
                        activeDotColor: Color.fromARGB(255, 244, 238, 177)),
                  ),

                  //next
                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return LoginPage();
                                },
                              ),
                            );
                          },
                          child: Text("Done",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: Text("Next",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
