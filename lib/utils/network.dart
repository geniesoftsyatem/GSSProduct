import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/generate_otp.dart';
import 'package:genie_money/Model/login_model.dart';
import 'package:genie_money/Model/registration_model.dart';
import 'package:genie_money/Screens/otp_screen.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class NetworkCall {
  Future<RegistrationModel> fetchRegistrationPosts(String email, String mobile_no, password,
      String os, String model, String latitude, String longitude, String install_location,
      BuildContext context) async {
    final body = {
      "email": email,
      "mobile_no": mobile_no,
      "password": password,
      "code": "",
      "code_name": "",
      "os": os,
      "phone_model": model,
      "lat": latitude,
      "lon": longitude,
      "install_location": install_location
    };

    final response = await http.post(
      Uri.parse(
          'http://143.110.176.111/genieshield/index.php/Api/user_registeration'),
      body: body,
    );

    if (response.statusCode == 200) {
      var response_server = jsonDecode(response.body);

      if (kDebugMode) {
        print(response_server);
      }

      if (response_server["response"] == "success") {
        _createToast("User registered successfully, Please login");
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const SignInScreen(),
          ),
          (route) => false,
        );
        return RegistrationModel.fromJson(json.decode(response.body));
      } else {
        _createToast("Failed to register User");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Failed to register User");
      throw Exception('Failed to load album');
    }
  }

  Future<Login_model> fetchLoginPosts(
      String email,
      String mobile_no,
      String password,
      String os,
      String model,
      String latitude,
      String longitude,
      String install_location,
      String manufacturer,
      String id,
      String otp,
      BuildContext context) async {
    final body = {
      "email": email,
      "mobile_no": mobile_no,
      "password": password,
      "code": "",
      "os": os,
      "phone_model": model,
      "lat": latitude,
      "lon": longitude,
      "install_location": install_location,
      "manufacturer": manufacturer,
      "id": id,
      "otp": otp
    };

    final response = await http.post(
      Uri.parse('http://143.110.176.111/genieshield/index.php/Api/user_login'),
      body: body,
    );

    if (response.statusCode == 200) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['response'] == 'success') {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        
        _createToast("Login Successful");
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const Home(),
          ),
          (route) => false,
        );
        // generateOtp(email, mobile_no, password, context);
        // if (email.isNotEmpty) {
        //   _createToast("OTP Sent to " + email);
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => OTPScreen(email)));
        // } else {
        //   _createToast("OTP Sent to " + mobile_no);
        //   Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => OTPScreen(mobile_no)));
        //   // Navigator.pushAndRemoveUntil<dynamic>(
        //   //   context,
        //   //   MaterialPageRoute<dynamic>(
        //   //     builder: (BuildContext context) => OTPScreen(mobile_no),
        //   //   ),
        //   //       (route) => false,
        //   // );
        // }
        return Login_model.fromJson(json.decode(response.body));
      } else {
        _createToast("Login Failed");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Login Failed");
      throw Exception('Failed to load album');
    }
  }

  Future<Generate_otp> generateOtp(String email, String mobile_no, String password, String os,
      String model, String latitude, String longitude, String install_location, String manufacturer,
      String id, BuildContext context) async {
    final body = {
      "email": email,
      "mobile_no": mobile_no,
      "password": password,
      'os': os,
      'phone_model': model,
      'lat': latitude,
      'lon': longitude,
      'install_location': install_location,
      "manufacturer": manufacturer,
      "id": id
    };

    final response = await http.post(
      Uri.parse(
          'http://143.110.176.111/genieshield/index.php/Api/user_login_otp'),
      body: body,
    );

    if (response.statusCode == 200) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['response'] == 'success') {
        if (email.isNotEmpty) {
          _createToast("OTP Sent to " + email);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(email, mobile_no, password)));
        } else {
          _createToast("OTP Sent to " + mobile_no);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(email, mobile_no, password)));
        }
        return Generate_otp.fromJson(json.decode(response.body));
      } else {
        _createToast("Login Failed");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Login Failed");
      throw Exception('Failed to load album');
    }
  }

  Future<Generate_otp> resendOtp(String email, String mobile_no, String password, BuildContext context) async {
    final body = {
      "email": email,
      "mobile_no": mobile_no,
      "password": password,
    };

    final response = await http.post(
      Uri.parse(
          'http://143.110.176.111/genieshield/index.php/Api/user_login_otp'),
      body: body,
    );

    if (response.statusCode == 200) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['response'] == 'success') {
        if (email.isNotEmpty) {
          _createToast("OTP Sent to " + email);
        } else {
          _createToast("OTP Sent to " + mobile_no);
        }
        return Generate_otp.fromJson(json.decode(response.body));
      } else {
        _createToast("Login Failed");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Login Failed");
      throw Exception('Failed to load album');
    }
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
