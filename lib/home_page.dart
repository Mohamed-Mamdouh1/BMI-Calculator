import 'dart:math';

import 'package:contacts/auth/login_page.dart';
import 'package:contacts/constants.dart';
import 'package:contacts/screens/man_screens.dart';
import 'package:contacts/screens/women_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  int height = 180;
  int weight = 68;
  int age = 20;

  userSignOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginPage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            splashColor: Colors.transparent,
              highlightColor: Colors.transparent,

              onTap: ()async {
              await userSignOut();
              },
              child: const Icon(
                Icons.logout_rounded,
                color: Color(0xfff50d56),
              )),
        ],
        title: const Text("BMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: kBackGround,
        elevation: 0,
      ),
      backgroundColor: kBackGround,
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        color: isMale == true
                            ? const Color(0xfff50d56)
                            : kPrimaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.man,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "MALE",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                        color:
                            isMale == false ? Color(0xfff50d56) : kPrimaryColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.woman,
                            size: 70,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "FEMALE",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                  color: kPrimaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.normal,
                          fontSize: 20),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${height.round()}",
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Text("cm",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        trackHeight: 2,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 14,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                        },
                        max: 220,
                        min: 80,
                        thumbColor: const Color(0xfff50d56),
                        activeColor: Colors.white70,
                        inactiveColor: Colors.grey[600],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "$weight",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              ),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Text(
                              'kg',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight--',
                              mini: true,
                              backgroundColor: const Color(0xff4c4f5d),
                              onPressed: () {
                                setState(() {
                                  weight <= 4 ? weight = 4 : weight--;
                                });
                              },
                              child: const Icon(
                                Icons.remove_rounded,
                                size: 30,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: "weight++",
                              mini: true,
                              backgroundColor: const Color(0xff4c4f5d),
                              onPressed: () {
                                setState(() {
                                  weight >= 250 ? weight = 250 : weight++;
                                });
                              },
                              child: const Icon(Icons.add_rounded),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      color: kPrimaryColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 20),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: "age--",
                              mini: true,
                              backgroundColor: const Color(0xff4c4f5d),
                              onPressed: () {
                                setState(() {
                                  age <= 1 ? age = 1 : age--;
                                });
                              },
                              child: const Icon(
                                Icons.remove_rounded,
                                size: 30,
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: 'age++',
                              mini: true,
                              backgroundColor: const Color(0xff4c4f5d),
                              onPressed: () {
                                setState(() {
                                  age >= 90 ? age = 90 : age++;
                                });
                              },
                              child: const Icon(Icons.add_rounded),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(18)),
              width: double.infinity,
              height: 70,
              child: MaterialButton(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
                onPressed: () {
                  var bmi = weight / pow(height / 100, 2) + age / 10;
                  if (isMale == true) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      print(bmi);
                      return MenScreens(
                        bmi: bmi,
                        isMale: 'MEN',
                      );
                    }));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WomenScreens(
                        bmi: bmi,
                        isMale: 'WOMEN',
                      );
                    }));
                  }
                },
                color: const Color(0xfff50d56),
                child: const Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
