import 'package:flutter/material.dart';
import 'package:furniture_app/view/screens/signup/signup_screen.dart';

import 'on_boarding_screen.dart';

// ignore: must_be_immutable
class OnBoardindScreen extends StatelessWidget {
  OnBoardindScreen({super.key});
  PageController? pageController;
  List<Widget> models = [
    OnBoarding(
      imageUrl: 'assets/images/onboarding1.png',
      text1: 'Design your Space Furniture with the help of Augmented Reality',
    ),
    OnBoarding(
      imageUrl: 'assets/images/onboarding 2.png',
      text1: 'View and Experience with Augmented Reality by Creating Room',
    ),
    OnBoarding(
      imageUrl: 'assets/images/onboarding3.png',
      text1:
          'Explore World class Top Furniture as per your requirments & Choice',
    )
  ];
  var cont = PageController();
  bool isLast = false;
  String text = "Next";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                             SignupScreen()));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black38,
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                )),
          ),
          FloatingActionButton(
            splashColor: Colors.white,
            backgroundColor: Colors.black38,
            onPressed: () {
              cont.nextPage(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOutCubicEmphasized);
              if (isLast) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: cont,
        itemBuilder: (context, index) => models[index],
        itemCount: models.length,
        scrollDirection: Axis.horizontal,
        onPageChanged: (pageIndex) {
          if (pageIndex == 2) {
            isLast = true;
          }
          if (pageIndex == 1) {
            text = "GetStarted";
          }
        },
      ),
    );
  }
}
