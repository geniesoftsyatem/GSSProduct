import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_shield/Model/registration_model.dart';
import 'package:genie_shield/Screens/signin_screen.dart';
import 'package:genie_shield/utils/network.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() {
    // TODO: implement createState
    return _SignupScreen();
  }
}

class _SignupScreen extends State<SignupScreen> {
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _mobile_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _confirm_password_controller =
      TextEditingController();

  Future<RegistrationModel>? _registrationResponse;

  NetworkCall networkCall = NetworkCall();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomPaint(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: const Alignment(-1, 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Existing user?",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInScreen()));
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 16.0,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(width, 30.0),
                                primary: const Color(0xFF111111),
                                shadowColor: const Color(0xFF111111),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              painter: HeaderCurvedContainer(),
            ),
            Expanded(
              flex: 4,
              child: Stack(
                alignment: const Alignment(-1, 1),
                children: [
                  SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "Sign up with",
                            style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "PRODUCT",
                            style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              fillColor: const Color(0xFF3A3A3A),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _email_controller,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            obscureText: true,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            decoration: InputDecoration(
                              hintText: 'Mobile number',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              fillColor: const Color(0xFF3A3A3A),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            controller: _mobile_controller,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            obscureText: true,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              fillColor: const Color(0xFF3A3A3A),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: _password_controller,
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            decoration: InputDecoration(
                              hintText: 'Re-confirm Password',
                              hintStyle: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                              fillColor: const Color(0xFF3A3A3A),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            controller: _confirm_password_controller,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              if (_email_controller.text.isNotEmpty) {
                                if (_mobile_controller.text.isNotEmpty) {
                                  if (_password_controller.text.isNotEmpty) {
                                    if (_confirm_password_controller
                                        .text.isNotEmpty) {
                                      if (_password_controller.text ==
                                          _confirm_password_controller.text) {
                                        String request_json =
                                            jsonEncode(<String, String>{
                                          "email": _email_controller.text,
                                          "alt_mobile_no":
                                              _mobile_controller.text,
                                          "password": _password_controller.text,
                                          "code": "",
                                          "code_name": ""
                                        });
                                        _registrationResponse = networkCall.fetchPosts(_email_controller.text, _mobile_controller.text, _password_controller.text, context);
                                      } else {
                                        _createToast("Password does not match");
                                      }
                                    } else {
                                      _createToast(
                                          "Please enter re-confirm password");
                                    }
                                  } else {
                                    _createToast("Please enter password");
                                  }
                                } else {
                                  _createToast("Please enter mobile number");
                                }
                              } else {
                                _createToast("Please enter email id");
                              }
                            },
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 16.0,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(width, 30.0),
                              primary: const Color(0xFFFFAE00),
                              shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: const EdgeInsets.only(
                                  left: 12.0, right: 12.0),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint()..color = const Color(0xFFFFAE00);
    // Path path = Path()
    //   ..lineTo(0, 150)
    //   ..lineTo(0, size.height - 50)
    //   ..quadraticBezierTo(
    //       size.width / 2, size.height - 50, size.width, size.height - 50)
    //   ..lineTo(size.width, 0)
    //   ..lineTo(0, 0)
    //   ..close();
    Paint paint = Paint()..color = const Color(0xFFFFAE00);
    Path path = Path()
      ..relativeLineTo(0, 250)
      ..quadraticBezierTo(size.width / 2, 130.0, size.width, 250)
      ..relativeLineTo(0, -250)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
