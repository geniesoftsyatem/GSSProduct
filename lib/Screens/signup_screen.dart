import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geolocator/geolocator.dart';

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

  NetworkCall networkCall = NetworkCall();
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late LocationPermission permission;
  late bool serviceEnabled = false;

  Future<void> _getLocation() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (serviceEnabled) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        latitude = position.latitude.toString();
        longitude = position.longitude.toString();
      } else {
        await Geolocator.openLocationSettings();
      }
    } else {
      permission = await Geolocator.requestPermission();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? font = DefaultTextStyle.of(context).style.fontFamily;
    print("font name :" + font!);
    _getLocation();
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: CustomPaint(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 40.0),
              child: Align(
                alignment: const Alignment(-1, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Existing user?",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 16.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, 40.0),
                        primary: const Color(0xFF111111),
                        shadowColor: const Color(0xFF111111),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.20,
                    ),
                    const Text(
                      "Sign up with",
                      style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "GENIE MONEY",
                      style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Enter Email',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.phone,
                      controller: _mobile_controller,
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Mobile number',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      obscureText: true,
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _password_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Password',
                        isDense: true,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    TextField(
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.visiblePassword,
                      controller: _confirm_password_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Re-confirm Password',
                        isDense: true,
                      ),
                    ),
                    // TextField(
                    //   style:
                    //   const TextStyle(color: Color(0xFFFFAE00)),
                    //   decoration: InputDecoration(
                    //     hintText: 'Enter Email',
                    //     hintStyle: const TextStyle(
                    //         fontSize: 14, color: Colors.grey),
                    //     fillColor: const Color(0xFF3A3A3A),
                    //     filled: true,
                    //     contentPadding: const EdgeInsets.only(
                    //         left: 16.0, right: 16.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.emailAddress,
                    //   controller: _email_controller,
                    // ),
                    // const SizedBox(height: 10),
                    // TextField(
                    //   style:
                    //   const TextStyle(color: Color(0xFFFFAE00)),
                    //   decoration: InputDecoration(
                    //     hintText: 'Mobile number',
                    //     hintStyle: const TextStyle(
                    //         fontSize: 14, color: Colors.grey),
                    //     fillColor: const Color(0xFF3A3A3A),
                    //     filled: true,
                    //     contentPadding: const EdgeInsets.only(
                    //         left: 16.0, right: 16.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.phone,
                    //   controller: _mobile_controller,
                    //   inputFormatters: [
                    //     LengthLimitingTextInputFormatter(10)
                    //   ],
                    // ),
                    // const SizedBox(height: 10),
                    // TextField(
                    //   obscureText: true,
                    //   style:
                    //   const TextStyle(color: Color(0xFFFFAE00)),
                    //   decoration: InputDecoration(
                    //     hintText: 'Password',
                    //     hintStyle: const TextStyle(
                    //         fontSize: 14, color: Colors.grey),
                    //     fillColor: const Color(0xFF3A3A3A),
                    //     filled: true,
                    //     contentPadding: const EdgeInsets.only(
                    //         left: 16.0, right: 16.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   controller: _password_controller,
                    // ),
                    // const SizedBox(height: 10),
                    // TextField(
                    //   style:
                    //   const TextStyle(color: Color(0xFFFFAE00)),
                    //   decoration: InputDecoration(
                    //     hintText: 'Re-confirm Password',
                    //     hintStyle: const TextStyle(
                    //         fontSize: 14, color: Colors.grey),
                    //     fillColor: const Color(0xFF3A3A3A),
                    //     filled: true,
                    //     contentPadding: const EdgeInsets.only(
                    //         left: 16.0, right: 16.0),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(20),
                    //     ),
                    //   ),
                    //   controller: _confirm_password_controller,
                    // ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                        var model, manufacturer, release, sdkInt, id;
                        if (Platform.isAndroid) {
                          AndroidDeviceInfo androidInfo =
                              await deviceInfo.androidInfo;
                          model = androidInfo.model;
                          manufacturer = androidInfo.manufacturer;
                          release = androidInfo.version.release;
                          sdkInt = androidInfo.version.sdkInt;
                          id = androidInfo.androidId;
                        } else {
                          IosDeviceInfo iosDevice = await deviceInfo.iosInfo;
                          model = iosDevice.name;
                          manufacturer = iosDevice.model;
                          release = iosDevice.systemName;
                          sdkInt = iosDevice.systemVersion;
                          id = iosDevice.identifierForVendor;
                        }

                        String sdk = "$sdkInt";
                        if (_email_controller.text.isNotEmpty) {
                          if (_mobile_controller.text.isNotEmpty) {
                            if (_mobile_controller.text.length == 10) {
                              if (_password_controller.text.isNotEmpty) {
                                if (_confirm_password_controller
                                    .text.isNotEmpty) {
                                  if (_password_controller.text ==
                                      _confirm_password_controller.text) {
                                    networkCall.fetchRegistrationPosts(
                                        _email_controller.text,
                                        _mobile_controller.text,
                                        _password_controller.text,
                                        release + " (" + sdk + ")",
                                        model,
                                        latitude,
                                        longitude,
                                        "",
                                        context);
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
                              _createToast("Please enter valid mobile number");
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
                        fixedSize: Size(width, 40.0),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            painter: HeaderCurvedContainer(height),
          ),
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
  double height;

  HeaderCurvedContainer(this.height);

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
      ..relativeLineTo(0, height * 0.30)
      ..quadraticBezierTo(size.width / 2, 130.0, size.width, height * 0.30)
      ..relativeLineTo(0, -height * 0.30)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
