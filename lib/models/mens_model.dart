import 'package:flutter/material.dart';

class MensModel {
  Color? appbarColor;
  String? backImage;
  String? advice;
  var bmi;
  MensModel({required this.bmi});

  Color? getAppBarColor() {
    if (bmi < 18.5) {
      appbarColor = const Color(0xffaed9d2);
    } else if (bmi >= 18.5 && bmi < 24.9) {
      appbarColor = const Color(0xff9ee656);
    } else if (bmi >= 24.9 && bmi < 29.9) {
      appbarColor = const Color(0xfffefb94);
    } else if (bmi >= 29.9 && bmi < 34.9) {
      appbarColor = const Color(0xfffdd708);
    } else if (bmi >= 34.9 && bmi < 39.9) {
      appbarColor = const Color(0xfffd881f);
    } else if (bmi >= 39.9) {
      appbarColor = const Color(0xfff57d87);
    }
    return appbarColor;
  }

  String getBackGroundImage() {
    if (bmi < 18.5) {
      backImage = "asset/underWeight.jpg";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      backImage = "asset/NormalWeight.jpg";
    } else if (bmi >= 24.9 && bmi < 29.9) {
      backImage = "asset/overWeight.jpg";
    } else if (bmi >= 29.9 && bmi < 34.9) {
      backImage = "asset/ObeseClass1.jpg";
    } else if (bmi >= 34.9 && bmi < 39.9) {
      backImage = "asset/obeseClass2.jpg";
    } else if (bmi >= 39.9) {
      backImage = "asset/ObeseClass3.jpg";
    }
    return backImage!;
  }

  String getAdvice() {
    if (bmi < 18.5) {
      advice = "You may be underWeight;please consult your GP advice";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      advice =
          "You are a healthy weight;maintain your current physical activity levels and calorie intake";
    } else if (bmi >= 24.9 && bmi < 29.9) {
      advice =
          "Start to reduce your calorie intake and increase physical activity levels; you may benefit from consulting a wight management practitioner for advice";
    } else if (bmi >= 29.9) {
      advice = "Seek advice from a weight management practitioner";
    }
    return advice!;
  }
}
