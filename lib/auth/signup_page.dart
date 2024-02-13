import 'package:contacts/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../componants/bmi_button.dart';
import '../componants/text_field.dart';
import '../constants.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState>formState=GlobalKey<FormState>();
  createUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>HomePage()), (route) => false);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xfff50d56),
            content: const Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xfff50d56),
            content: const Text("The account already exists for that email."),
          ),
        );
      }
      else if(e.code=="invalid-email"){

        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor:const  Color(0xfff50d56),
            content: const Text("Please Enter a valid Email address."),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Form(
        key:formState ,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.2, right: 40, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign Up ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      BMITextField(
                        validator: (val) {
                          if (val == "") {
                            return "This field can not be empty";
                          }
                        },
                        controller: emailController,
                        hintText: "Please Enter Email ",
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
                        hintText: "Please Enter Password ",
                        prefixIcon: Icons.password,
                        obscure: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       BMIButton(
                        onPressed: ()async{
                          if(formState.currentState!.validate())
                          {
                          await  createUser();

                          }else{
                            print ("Error");
                          }
                        },
                        text: "SIGN UP",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Have an account ?",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(

                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              primary: Colors.transparent,
                            ),
                            child: const Text(
                              "Login Here",
                              style: TextStyle(
                                color: Color(0xfff50d56),
                              ),
                            ),

                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
