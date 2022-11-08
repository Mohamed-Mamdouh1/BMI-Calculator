import 'package:contacts/constants.dart';
import 'package:contacts/models/mens_model.dart';
import 'package:flutter/material.dart';

class MenScreens extends StatelessWidget {
  MenScreens({
    Key? key,
    required this.bmi,
    required this.isMale,
  }) : super(key: key);
  var bmi;
  String isMale;

  @override
  Widget build(BuildContext context) {
    MensModel men = MensModel(bmi: bmi);
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: Colors.black54,
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Bmi Result For $isMale ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          backgroundColor: men.getAppBarColor()),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(men.getBackGroundImage()),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
              child: Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xfff50d56),
                  blurRadius: 1,
                  offset: Offset(10, 10),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Color(0xfff50d56),
                  blurRadius: 1,
                  offset: Offset(-10, -10),
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.circular(18),
              color: kPrimaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "YOUR BMI RESULT IS : ${bmi.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: men.getAppBarColor(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  men.getAdvice(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: men.getAppBarColor(),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          )),
        )
      ]),
    );
  }
}
