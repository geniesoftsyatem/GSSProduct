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

class _SignInScreen extends State<SignInScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _email_mobile_controller =
      TextEditingController();

  final TextEditingController _password_controller = TextEditingController();
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late LocationPermission permission;
  late bool serviceEnabled = false;

  late TabController _tabController;
  late String title = "Customer";

  double curve = 400;
  double height_angle = 330;

  late String selected_type = "Retailer";

  List<String> business_type_list = [
    'Retailer',
    'Distributor',
    'Super Stockist'
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _getLocation();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Color(0xFFFFAE00)),
                  onTap: (value) {
                    setState(() {
                      if (value == 0) {
                        title = "Customer";
                        curve = 400;
                        height_angle = 330;
                      } else if (value == 1) {
                        title = "Sales Partner";
                      } else {
                        title = "Employee";
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
                customer_login_ui(height, context, width),
                // SizedBox(
                //   height: height * 1.0,
                //   child: TabBarView(
                //     // controller: _tabController,
                //       children: [
                //         customer_login_ui(height, context, width),
                //         customer_login_ui(height, context, width),
                //         customer_login_ui(height, context, width),
                //       ]
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text(
          "SIGN UP",
          style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 15.0,
              fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize:
          Size(width * 0.90, MediaQuery.of(context).size.height * 0.05),
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
                  builder: (context) => SignupScreen(title)));
        },
      ),
    );
  }

  Widget customer_login_ui(double height, BuildContext context, double width) {
    return CustomPaint(
      child: Container(
        margin: EdgeInsets.only(
            top: 10.0,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05),
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  'Please Login As $title To Continue',
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF111111),
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: TextField(
                    controller: _email_mobile_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Email / Mobile No.',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0),
                  child: TextField(
                    controller: _password_controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'Password',
                      isDense: true,
                    ),
                    obscureText: true,
                  ),
                ),
                Visibility(
                  visible: title == "Sales Partner" ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: const Color(0xFFFFAE00),
                      isExpanded: true,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF111111)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF111111)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF111111)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF111111)),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        isDense: true,
                      ),
                      value: selected_type,
                      isDense: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFF111111),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Color(0xFF111111), fontSize: 18),
                      onChanged: (String? data) {
                        setState(() {
                          selected_type = data ?? "Retailer";
                        });
                      },
                      items: business_type_list
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 20.0),
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
                          width * 0.90, MediaQuery.of(context).size.height * 0.05),
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
                            NetworkCall networdCall = NetworkCall();
                            networdCall.generateOtp(
                                _email_mobile_controller.text,
                                _password_controller.text,
                                title,
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
                  margin: const EdgeInsets.only(
                      top: 10.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      "FORGOT PASSWORD ?",
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80.0,
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
              ],
            ),
          ],
        ),
      ),
      painter: HeaderCurvedContainer(context, height_angle, curve),
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
  double height;
  double curve;

  HeaderCurvedContainer(this.context, this.height, this.curve);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFFFAE00);
    Path path = Path()
      ..relativeLineTo(0, height)
      ..quadraticBezierTo(
          size.width / 2,
          curve,
          size.width,
          height)
      ..relativeLineTo(0, -height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
