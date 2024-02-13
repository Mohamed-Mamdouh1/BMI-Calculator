import 'package:contacts/auth/signup_page.dart';
import 'package:contacts/componants/bmi_button.dart';
import 'package:contacts/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../componants/text_field.dart';
import '../constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  userLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
       Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => HomePage()), (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xfff50d56),
            content: const Text("No user found for that email.")));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xfff50d56),
            content: const Text("Wrong password provided for that user.")));
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xfff50d56),
            content: const Text("Please Enter a valid Email address."),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Form(
        key: formState,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 40, left: 40),
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "BMI CALCULATOR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(23)),
                      child: Image.asset(
                        "asset/logo.jpg",
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BMITextField(
                      validator: (val) {
                        if (val == "") {
                          return "This field can not be empty";
                        }
                      },
                      controller: emailController,
                      hintText: "Please Enter Your Email ",
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BMITextField(
                      validator: (val) {
                        if (val == "") {
                          return "This field can not be empty";
                        }
                      },
                      controller: passwordController,
                      hintText: "Please Enter Your Password ",
                      prefixIcon: Icons.password,
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BMIButton(
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          await userLogin();
                        } else {
                          print("Error");
                        }
                      },
                      text: "LOGIN",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => SignUpPage()));
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.transparent,
                          ),
                          child: const Text(
                            "Register Here",
                            style: TextStyle(
                              color: Color(0xfff50d56),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
