import 'package:flutter/material.dart';

import '../hompage/Bottomnavbar.dart';
import '../../widgets/public_button.dart';

class Congrats extends StatefulWidget {
  const Congrats({super.key});

  @override
  State<Congrats> createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "SUCCESS!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Calisto MT"),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  onPressed: () {}),
              Image.asset(
                'assets/images/congrat.png',
                fit: BoxFit.fill,
              ),
              const Text(
                "Your order will be delivered soon. \n Thank you for chossing our app!",
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ),
              const SizedBox(
                height: 50,
              ),
              PublicButton(
                title: "Track your orders ",
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                width: 250,
                height: 40,
                borderRadius: 10,
                titleSize: 16,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              PublicButton(
                title: "BACK TO HOME ",
                backgroundColor: Colors.white,
                titleColor: Colors.black,
                width: 250,
                height: 40,
                borderRadius: 10,
                titleSize: 16,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavigationBarExample()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
