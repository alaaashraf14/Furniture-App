import 'package:flutter/material.dart';

import '../../widgets/public_button.dart';
import '../../widgets/public_text.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(fit: StackFit.expand, children: [
        Image.asset(
          'assets/images/splash_screen.png',
          fit: BoxFit.fill,
        ),
        Column(children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 140, 150, 0),
            child: PublicText(
              txt: 'MAKE YOUR',
              size: 40,
              fw: FontWeight.w700,
              ff: "Petrona",
              color: Colors.black26,
            ),
          ),
          const PublicText(
            txt: 'HOME BEAUTIFUL',
            size: 36,
            fw: FontWeight.w600,
            ff: "Petrona",
            color: Colors.black,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 50, 20),
            child: PublicText(
              txt:
                  'The best simple place where \n you discover most wonderful \n furnitures and make your \n home beautiful',
              size: 20,
              fw: FontWeight.w400,
              ff: "Petrona",
              color: Colors.black38,
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PublicButton(
                          title: "Sign in ",
                          backgroundColor: Colors.black45,
                          titleColor: Colors.white,
                          width: 200,
                          height: 60,
                          borderRadius: 25,
                          titleSize: 16,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OnBoardindScreen()),
                            );
                          },
                        ),
                      ]))),
        ]),
      ]),
    ));
  }
}
