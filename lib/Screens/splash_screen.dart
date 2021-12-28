import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genie_money/Screens/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void _nextScreen(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const OnBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    _nextScreen(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/splash_screen.png"),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }
}
