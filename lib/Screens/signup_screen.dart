import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geolocator/geolocator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() {
    // TODO: implement createState
    return _SignupScreen();
  }
}

class _SignupScreen extends State<SignupScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _mobile_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();
  final TextEditingController _confirm_password_controller = TextEditingController();
  final TextEditingController _employee_code_controller = TextEditingController();

  NetworkCall networkCall = NetworkCall();
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late LocationPermission permission;
  late bool serviceEnabled = false;
  bool isChecked = true;
  bool showWeb = false;
  bool isLoading = true;
  String url = "http://geniesoftsystem.com/";
  final _key = UniqueKey();
  late String selected_type = "Retailer";
  late String type = "Customer";

  late TabController _tabController;

  double curve = 130;
  double height_angle = 190;

  List<String> business_type_list = [
    'Retailer',
    'Distributor',
    'Super Distributor'
  ];

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

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    if (showWeb) {
      setState(() {
        showWeb = false;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String? font = DefaultTextStyle.of(context).style.fontFamily;
    print("font name :" + font!);
    _getLocation();
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: showWeb,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1.0),
                        height: height * 0.95,
                        child: WebView(
                          key: _key,
                          initialUrl: url,
                          javascriptMode: JavascriptMode.unrestricted,
                          onPageStarted: (value) {
                            Center(
                              child: Visibility(
                                visible: isLoading,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          onPageFinished: (finish) {
                            setState(() {
                              isLoading = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !showWeb,
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        TabBar(
                          indicator: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Color(0xFFFFAE00)),
                          onTap: (value) {
                            setState(() {
                              if (value == 0) {
                                type = "Customer";
                              } else if (value == 1) {
                                type = "Sales Partner";
                              } else {
                                type = "Employee";
                              }
                            });
                          },
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          controller: _tabController,
                          labelColor: const Color(0xFF111111),
                          unselectedLabelColor: const Color(0xFFFFAE00),
                          tabs: const [
                            Tab(
                              child: Text(
                                "Customer",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Sales Partner",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Employee",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        CustomPaint(
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    fixedSize: Size(width, 40.0),
                                    primary: const Color(0xFF111111),
                                    shadowColor: const Color(0xFF111111),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 80.0,
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
                                  "Genie Money",
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                TextField(
                                  style:
                                      const TextStyle(color: Color(0xFFFFAE00)),
                                  cursorColor: const Color(0xFFFFAE00),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _email_controller,
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFFFFAE00)),
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
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  style:
                                      const TextStyle(color: Color(0xFFFFAE00)),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFFFFAE00)),
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
                                  style:
                                      const TextStyle(color: Color(0xFFFFAE00)),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFFFFAE00)),
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
                                  style:
                                      const TextStyle(color: Color(0xFFFFAE00)),
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFAE00)),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Color(0xFFFFAE00)),
                                    // hintText: 'Email / Mobile No.',
                                    labelText: 'Re-confirm Password',
                                    isDense: true,
                                  ),
                                ),
                                SizedBox(height: height * 0.02),
                                Visibility(
                                  visible: type == "Sales Partner" ? true : false,
                                  child: DropdownButtonFormField<String>(
                                    dropdownColor: const Color(0xFF3A3A3A),
                                    isExpanded: true,
                                    decoration: const InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Color(0xFFFFAE00)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      isDense: true,
                                    ),
                                    value: selected_type,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xFFFFAE00),
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00), fontSize: 18),
                                    onChanged: (String? data) {
                                      setState(() {
                                        selected_type =
                                            data ?? "Select Business Type";
                                      });
                                    },
                                    items: business_type_list
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Visibility(
                                  visible: type == "Employee" ? true : false,
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0),
                                    child: TextField(
                                      cursorColor: const Color(0xFFFFAE00),
                                      controller: _employee_code_controller,
                                      style:
                                      const TextStyle(color: Color(0xFFFFAE00)),
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFAE00)),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFAE00)),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFAE00)),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xFFFFAE00)),
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        labelStyle: const TextStyle(
                                            color: Color(0xFFFFAE00)),
                                        // hintText: 'Email / Mobile No.',
                                        labelText: 'Employee Code',
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.02),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: const Color(0xFFFFAE00),
                                        value: isChecked,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                      const Text(
                                        "I Agree to the ",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (showWeb) {
                                              showWeb = false;
                                            } else {
                                              showWeb = true;
                                            }
                                          });
                                        },
                                        child: const Text(
                                          "Terms & Conditions.",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () async {
                                    DeviceInfoPlugin deviceInfo =
                                        DeviceInfoPlugin();
                                    var model,
                                        manufacturer,
                                        release,
                                        sdkInt,
                                        id;
                                    if (Platform.isAndroid) {
                                      AndroidDeviceInfo androidInfo =
                                          await deviceInfo.androidInfo;
                                      model = androidInfo.model;
                                      manufacturer = androidInfo.manufacturer;
                                      release = androidInfo.version.release;
                                      sdkInt = androidInfo.version.sdkInt;
                                      id = androidInfo.androidId;
                                    } else {
                                      IosDeviceInfo iosDevice =
                                          await deviceInfo.iosInfo;
                                      model = iosDevice.name;
                                      manufacturer = iosDevice.model;
                                      release = iosDevice.systemName;
                                      sdkInt = iosDevice.systemVersion;
                                      id = iosDevice.identifierForVendor;
                                    }

                                    String sdk = "$sdkInt";
                                    if (_email_controller.text.isNotEmpty) {
                                      if (_mobile_controller.text.isNotEmpty) {
                                        if (_mobile_controller.text.length ==
                                            10) {
                                          if (_password_controller
                                              .text.isNotEmpty) {
                                            if (_confirm_password_controller
                                                .text.isNotEmpty) {
                                              if (_password_controller.text ==
                                                  _confirm_password_controller
                                                      .text) {
                                                if (type == "Customer") {
                                                  networkCall
                                                      .fetchRegistrationPosts(
                                                      _email_controller.text,
                                                      _mobile_controller.text,
                                                      _password_controller
                                                          .text,
                                                      release +
                                                          " (" +
                                                          sdk +
                                                          ")",
                                                      model,
                                                      latitude,
                                                      longitude,
                                                      "",
                                                      "Customer",
                                                      context);
                                                } else if (type == "Employee") {
                                                  networkCall
                                                      .fetchRegistrationPosts(
                                                      _email_controller.text,
                                                      _mobile_controller.text,
                                                      _password_controller
                                                          .text,
                                                      release +
                                                          " (" +
                                                          sdk +
                                                          ")",
                                                      model,
                                                      latitude,
                                                      longitude,
                                                      "",
                                                      "Employee",
                                                      context);
                                                } else {
                                                  networkCall
                                                      .fetchRegistrationPosts(
                                                      _email_controller.text,
                                                      _mobile_controller.text,
                                                      _password_controller
                                                          .text,
                                                      release +
                                                          " (" +
                                                          sdk +
                                                          ")",
                                                      model,
                                                      latitude,
                                                      longitude,
                                                      "",
                                                      selected_type,
                                                      context);
                                                }
                                              } else {
                                                _createToast(
                                                    "Password does not match");
                                              }
                                            } else {
                                              _createToast(
                                                  "Please enter re-confirm password");
                                            }
                                          } else {
                                            _createToast(
                                                "Please enter password");
                                          }
                                        } else {
                                          _createToast(
                                              "Please enter valid mobile number");
                                        }
                                      } else {
                                        _createToast(
                                            "Please enter mobile number");
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
                              ],
                            ),
                          ),
                          painter: HeaderCurvedContainer(height_angle, curve),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createToast(String message) {
/*    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);*/
  }
}

class HeaderCurvedContainer extends CustomPainter {
  double height;
  double curve;

  HeaderCurvedContainer(this.height, this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFFFAE00);
    Path path = Path()
      ..relativeLineTo(0, height)
      ..quadraticBezierTo(size.width / 2, curve, size.width, height)
      ..relativeLineTo(0, -height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
