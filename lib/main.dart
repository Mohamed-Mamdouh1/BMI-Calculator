
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(BmiApp());
}

class BmiApp extends StatelessWidget {
   BmiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),

    );
  }
}
