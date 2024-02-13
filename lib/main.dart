import 'package:contacts/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BmiApp());
}

class BmiApp extends StatefulWidget {
  BmiApp({Key? key}) : super(key: key);

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .userChanges()
        .listen(
            (User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          useMaterial3: true,

          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24))),
      debugShowCheckedModeBanner: false,
      home:
      FirebaseAuth.instance.currentUser != null?
      HomePage():
     const  LoginPage(),
    );
  }
}
