import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:genie_shield/home.dart';
import 'package:genie_shield/utils/network.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

class OTPScreen extends StatefulWidget {
  String email,mobile_no, password;

  OTPScreen(this.email, this.mobile_no, this.password, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OtpScreen();
}

class _OtpScreen extends State<OTPScreen> {
  Color boxColor = const Color(0xFFFFAE00);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 90;
    double height = SizeConfig.blockSizeVertical! * 50;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF111111),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: const Color(0xFF3A3A3A),
                  shadowColor: const Color(0xFF3A3A3A),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "GSS Product",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "Enter the one-time verification code",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "Enter the 4-digit verification code that was sent to the number\nYour Mobile No.",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 10.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: OtpTextField(
                          numberOfFields: 4,
                          borderColor: boxColor,
                          focusedBorderColor: boxColor,
                          cursorColor: boxColor,
                          keyboardType: TextInputType.number,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          fieldWidth: MediaQuery.of(context).size.width * 0.18,
                          textStyle: const TextStyle(color: Color(0xFFFFAE00), fontSize: 20.0),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) async {
                            DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                            var model, manufacturer, release, sdkInt, id;
                            if (Platform.isAndroid) {
                              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
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
                            NetworkCall networkcall = NetworkCall();
                            networkcall.fetchLoginPosts(widget.email, widget.mobile_no, widget.password, release + " (" + sdk + ")", model, "", "", "", manufacturer, id, verificationCode, context);
                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: Text("Verification Code"),
                            //         content: Text(
                            //             'Code entered is $verificationCode'),
                            //       );
                            //     });
                          }, // end onSubmit
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  child: ElevatedButton(
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
