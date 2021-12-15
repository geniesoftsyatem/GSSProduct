import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'Screens/onboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF111111),
      100: Color(0xFF111111),
      200: Color(0xFF111111),
      300: Color(0xFF111111),
      400: Color(0xFF111111),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF111111),
      700: Color(0xFF111111),
      800: Color(0xFF111111),
      900: Color(0xFF111111),
    },
  );
  static const int _blackPrimaryValue = 0xFF111111;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => FlutterSizer(
      builder: (BuildContext , Orientation , ScreenType ) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: primaryBlack,
          ),
          home: const OnBoardScreen(),
        );
      },
    );
}
