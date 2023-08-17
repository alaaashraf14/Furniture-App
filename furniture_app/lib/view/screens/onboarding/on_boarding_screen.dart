// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OnBoarding extends StatelessWidget {
  String imageUrl;
  String text1;

  final PageController? pageController;

  OnBoarding({
    Key? key,
    required this.imageUrl,
    required this.text1,
   
    this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageUrl, fit: BoxFit.fill),
           Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 20, left: 15),
            ),
            Text(
              text1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.black),
            ),
          
         
          ],
        ),
      ),
    );
  }
}
