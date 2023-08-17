import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/view/screens/hompage/Bottomnavbar.dart';

import '../../widgets/public_button.dart';
import '../../widgets/public_divider.dart';
import '../../widgets/public_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth instance = FirebaseAuth.instance;
  bool visible = true;

  var formkey = GlobalKey<FormState>();

  var c = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const PublicDivider(),
                          CircleAvatar(
                            radius: 45,
                            child: Image.asset(
                              'assets/images/sigup.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          const PublicDivider(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PublicText(
                        txt: 'Hello!',
                        size: 32,
                        fw: FontWeight.w600,
                        ff: "Petrona",
                        color: Colors.black38,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const PublicText(
                        txt: 'WELCOME BACK',
                        size: 32,
                        fw: FontWeight.w600,
                        ff: "Petrona",
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black38,
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                    
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                return 'Please enter your email';
                          }
                          return null;
                        },
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black38,
                          ),
                          labelText: 'Email',
                          fillColor: Colors.black38,
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black38,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.black38,
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password canMt be empty";
                          } else if (value.length < 5) {
                            return "password is too short";
                          }
                          return null;
                        },
                        onFieldSubmitted: (String value) {
                          print(value);
                        },
                        onChanged: (String value) {
                          print(value);
                        },
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            color: Colors.black38,
                          ),
                          labelText: 'Password',
                          fillColor: Colors.black38,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black38,
                          ),
                          suffixIcon: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.black,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black38,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Colors.black38,
                              width: 2.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                              color: Colors.black38,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                            onPressed: () {},
                            child: const PublicText(
                              txt: 'Forget password?',
                              size: 16,
                              color: Colors.black,
                              ff: "Roboto",
                              fw: FontWeight.w400,
                            )),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      PublicButton(
                        title: "LOG IN ",
                        backgroundColor: Colors.black,
                        titleColor: Colors.white,
                        width: 350,
                        height: 65,
                        borderRadius: 20,
                        titleSize: 16,
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            print(value..user!.email);
                            print(value.user!.uid);
                          }).catchError((error) {
                            print(error.toString());
                          });
              
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BottomNavigationBarExample()),
                          );
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
