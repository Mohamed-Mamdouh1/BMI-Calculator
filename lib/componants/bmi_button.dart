import 'package:flutter/material.dart';

class BMIButton extends StatelessWidget {
  const BMIButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
 final  void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*.3,left: MediaQuery.of(context).size.width*.3),
        primary: const Color(0xfff50d56),
      ),
        child: Text(text,style: TextStyle(color: Colors.white),),


    );
  }
}
