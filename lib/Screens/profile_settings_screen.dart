import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:genie_money/Screens/personal_details.dart';
import 'package:genie_money/Screens/refer_and_earn_screen.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String percentage = "0";
  String employment_percentage = "0";
  String bank_percentage = "0";
  String photo_percentage = "0";

  int value = 0;
  int value1 = 0;
  int value2 = 0;
  int value3 = 0;
  int emp_value = 0;
  int emp_value1 = 0;
  int emp_value2 = 0;
  int emp_value3 = 0;
  int bank_value = 0;
  int bank_value1 = 0;
  int bank_value2 = 0;
  int bank_value3 = 0;
  int photo_value = 0;
  int photo_value1 = 0;
  int photo_value2 = 0;
  int photo_value3 = 0;

  int flag = 0;
  int flag1 = 0;
  int flag2 = 0;
  int flag3 = 0;
  late Timer timer, timer1, timer2, timer3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _showProgress();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Profile Settings",
            style: TextStyle(color: Color(0xFFFFAE00)),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFFAE00),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: width,
                // height: height * 0.30,
                color: const Color(0xFFFFAE00),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Image(
                        image: AssetImage("images/crown_silver.png"),
                        width: width * 0.50,
                        //height: height * 0.40,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: const Text(
                        "Genie Money - Silver",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                    ),
                  ],
                ),
              ),
              // Center(
              //   child: ClipPath(
              //     clipper: CustomClipPath(),
              //     child: Container(
              //       width: width * 0.40,
              //       height: height * 0.10,
              //       color: const Color(0xFFFFAE00),
              //     ),
              //   ),
              // ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: const Color(0xFF3A3A3A),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PersonalDetailsScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        "images/personal_details.png"),
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "PERSONAL DETAILS",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.07,
                                  ),
                                  Text(
                                    percentage + "% Completed",
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 13.0),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF4285F4),
                                      currentValue: value,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 4),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF4285F4),
                                      currentValue: value1,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 6),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF4285F4),
                                      currentValue: value2,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF4285F4),
                                      currentValue: value3,
                                      size: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        "images/employement_details.png"),
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "EMPLOYMENT DETAILS",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Text(
                                    employment_percentage + "% Completed",
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 13.0),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFEA4335),
                                      currentValue: emp_value,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 4),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFEA4335),
                                      currentValue: emp_value1,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 6),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFEA4335),
                                      currentValue: emp_value2,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFEA4335),
                                      currentValue: emp_value3,
                                      size: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Image(
                                    image:
                                        AssetImage("images/bank_details.png"),
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "BANK DETAILS",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.20,
                                  ),
                                  Text(
                                    bank_percentage + "% Completed",
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 13.0),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFFBBC05),
                                      currentValue: bank_value,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 4),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFFBBC05),
                                      currentValue: bank_value1,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 6),
                                      backgroundColor: const Color(0xFF111111),
                                      progressColor: const Color(0xFFFBBC05),
                                      currentValue: bank_value2,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFFFBBC05),
                                      currentValue: bank_value3,
                                      size: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Card(
                        color: const Color(0xFF3A3A3A),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  const Image(
                                    image:
                                        AssetImage("images/photo_proofs.png"),
                                    width: 30.0,
                                    height: 30.0,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "PHOTO PROOFS",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 16.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.15,
                                  ),
                                  Text(
                                    photo_percentage + "% Completed",
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 13.0),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              width: width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF34A853),
                                      currentValue: photo_value,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 4),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF34A853),
                                      currentValue: photo_value1,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 6),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF34A853),
                                      currentValue: photo_value2,
                                      size: 10.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.20,
                                    child: FAProgressBar(
                                      // animatedDuration: const Duration(seconds: 2),
                                      backgroundColor: const Color(0xFF111111),
                                      maxValue: 25,
                                      progressColor: const Color(0xFF34A853),
                                      currentValue: photo_value3,
                                      size: 10.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text("Please ensure your profile is 100% complete", style: TextStyle(color: Color(0xFFFFAE00),),),
              ),
              const Text("Update your profile regularly to get maximum benefit", style: TextStyle(color: Color(0xFFFFAE00),)),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Card(
                  color: const Color(0xFF3A3A3A),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                        child: const Image(
                          image: AssetImage("images/refer_and_earn_profile_settings.png"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                        width: width * 0.60,
                        child: Column(
                          children:[
                            const Text("Refer & Earn Unlimited Cash", style: TextStyle(color: Color(0xFFFFAE00)),),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => const ReferAndEarnScreen()));
                                },
                                child: const Text(
                                  "Refer Now",
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 16.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(width * 0.50, 30.0),
                                  primary: const Color(0xFFFFAE00),
                                  shadowColor: const Color(0xFFFFAE00),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ),
                      ),
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void change_ui() {
    setState(() {
      if (flag <= 25) {
        ++value;
      } else if (flag > 25 && flag <= 50) {
        ++value1;
      } else if (flag > 50 && flag <= 75) {
        ++value2;
      } else {
        ++value3;
      }
      percentage = flag.toString();
    });
  }

  void emp_change_ui() {
    setState(() {
      if (flag1 <= 25) {
        ++emp_value;
      } else if (flag1 > 25 && flag1 <= 50) {
        ++emp_value1;
      } else if (flag1 > 50 && flag1 <= 75) {
        ++emp_value2;
      } else {
        ++emp_value3;
      }
      employment_percentage = flag1.toString();
    });
  }

  void bank_change_ui() {
    setState(() {
      if (flag2 <= 25) {
        ++bank_value;
      } else if (flag2 > 25 && flag2 <= 50) {
        ++bank_value1;
      } else if (flag2 > 50 && flag2 <= 75) {
        ++bank_value2;
      } else {
        ++bank_value3;
      }
      bank_percentage = flag2.toString();
    });
  }

  void photo_change_ui() {
    setState(() {
      if (flag3 <= 25) {
        ++photo_value;
      } else if (flag3 > 25 && flag3 <= 50) {
        ++photo_value1;
      } else if (flag3 > 50 && flag3 <= 75) {
        ++photo_value2;
      } else {
        ++photo_value3;
      }
      photo_percentage = flag3.toString();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    timer1.cancel();
    timer2.cancel();
    timer3.cancel();
    super.dispose();
  }

  void _showProgress() async {
    int personal_prog = 100;
    int emp_prog = 75;
    int bank_prog = 50;
    int photo_prog = 25;

    timer = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      ++flag;
      if (flag > personal_prog) {
        t.cancel();
      } else {
        change_ui();
      }
    });

    timer1 = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      ++flag1;
      if (flag1 > emp_prog) {
        t.cancel();
      } else {
        emp_change_ui();
      }
    });

    timer2 = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      ++flag2;
      if (flag2 > bank_prog) {
        t.cancel();
      } else {
        bank_change_ui();
      }
    });

    timer3 = Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      ++flag3;
      if (flag3 > photo_prog) {
        t.cancel();
      } else {
        photo_change_ui();
      }
    });
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
