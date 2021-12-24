import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/forgot_password_screen.dart';
import 'package:genie_money/Screens/signup_screen.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geolocator/geolocator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreen createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  final TextEditingController _email_mobile_controller =
      TextEditingController();

  final TextEditingController _password_controller = TextEditingController();
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _getLocation();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: CustomPaint(
          child: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Genie Money',
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Color(0xFF111111),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Please Login To Continue',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: TextField(
                    controller: _email_mobile_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Email / Mobile No.',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextField(
                      controller: _password_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        // hintText: 'Password',
                        labelText: 'Password',
                        isDense: true,
                      ),
                      obscureText: true,
                    )),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: ElevatedButton(
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          width, MediaQuery.of(context).size.height * 0.05),
                      primary: const Color(0xFF111111),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
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

                      if (_email_mobile_controller.text.isNotEmpty) {
                        if (_password_controller.text.isNotEmpty) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_email_mobile_controller.text);
                          bool mobileValid =
                              RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                  .hasMatch(_email_mobile_controller.text);
                          if (emailValid || mobileValid) {
                            NetworkCall netword_call = NetworkCall();
                            netword_call.generateOtp(
                                _email_mobile_controller.text,
                                _password_controller.text,
                                context);
                          } else {
                            _createToast(
                                "Please enter valid email id / mobile no");
                          }
                        } else {
                          _createToast("Please enter password");
                        }
                      } else {
                        _createToast("Please enter your email id / mobile no");
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: Text(
                      "FORGOT PASSWORD ?",
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                const Center(
                  child: Text(
                    "OR",
                    style: TextStyle(
                        color: Color(0xFFFFAE00),
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                ElevatedButton(
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignupScreen()));
                  },
                ),
              ],
            ),
          ),
          painter: HeaderCurvedContainer(context),
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
  BuildContext context;

  HeaderCurvedContainer(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFFFAE00);
    Path path = Path()
      ..relativeLineTo(0, MediaQuery.of(context).size.height * 0.65)
      ..quadraticBezierTo(
          size.width / 2,
          MediaQuery.of(context).size.height * 0.75,
          size.width,
          MediaQuery.of(context).size.height * 0.65)
      ..relativeLineTo(0, -MediaQuery.of(context).size.height * 0.65)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
