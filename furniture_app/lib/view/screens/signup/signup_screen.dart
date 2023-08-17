import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/view/screens/login/login_screen.dart';
import 'package:furniture_app/view/widgets/public_button.dart';

import '../hompage/Bottomnavbar.dart';
import '../../widgets/public_divider.dart';
import '../../widgets/public_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool visible = true;

  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();

  var passwordController = TextEditingController();
  var confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const PublicDivider(),
                        CircleAvatar(
                          radius: 45,
                          child: Image.asset(
                            'assets/images/sigup.png',
                            //fit: BoxFit.fill,
                          ),
                        ),
                        const PublicDivider(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const PublicText(
                      txt: 'WELCOME',
                      size: 32,
                      fw: FontWeight.w600,
                      ff: "Petrona",
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black45),
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name not be empty";
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
                        labelText: 'Name',
                        labelStyle: const TextStyle(
                          color: Colors.black38,
                        ),
                        fillColor: Colors.black38,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black38,
                        ),
                        border: const OutlineInputBorder(),
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
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email not be empty";
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
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(
                          color: Colors.black38,
                        ),
                        fillColor: Colors.black38,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.black38,
                        ),
                        border: const OutlineInputBorder(),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password not be empty";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
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
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: visible
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.visibility_off)),
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
                      height: 20.0,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.black38,
                      ),
                      controller: confirmController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "confirm password not be empty";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
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
                        labelText: 'Confirm Password',
                        fillColor: Colors.black38,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.black38,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                              });
                            },
                            icon: visible
                                ? const Icon(Icons.remove_red_eye)
                                : const Icon(Icons.visibility_off)),
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
                      height: 20.0,
                    ),
                    PublicButton(
                      title: "SIGN UP ",
                      backgroundColor: Colors.black,
                      titleColor: Colors.white,
                      width: 350,
                      height: 65,
                      borderRadius: 20,
                      titleSize: 16,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );

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
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PublicText(
                          txt: 'Aleardy have account?',
                          size: 16,
                          fw: FontWeight.w400,
                          ff: "Roboto",
                          color: Colors.black38,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationBarExample()),
                              );
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                            ),
                            child: const Text(
                              'SING IN',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Roboto"),
                            ))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
