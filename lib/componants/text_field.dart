import 'package:flutter/material.dart';

class BMITextField extends StatelessWidget {
  const BMITextField({Key? key, required this.controller, required this.hintText, this.obscure, required this.prefixIcon, required this.validator}) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool? obscure;
  final IconData prefixIcon;
  final String? Function(String?) validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: Colors.deepPurple,
      obscureText: obscure==null?false:true,
      controller: controller,

      decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Icon(
              prefixIcon,
              color: const Color(0xfff50d56),
            ),
          ),
          hintText: hintText,
          labelStyle: TextStyle(color: Colors.deepPurple,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),

          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
