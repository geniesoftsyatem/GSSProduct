import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/generate_otp.dart';
import 'package:genie_money/Model/login_model.dart';
import 'package:genie_money/Model/registration_model.dart';
import 'package:genie_money/Screens/otp_screen.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';

class NetworkCall {
  Future<RegistrationModel> fetchRegistrationPosts(
      String email,
      String mobile_no,
      String password,
      String os,
      String model,
      String latitude,
      String longitude,
      String install_location,
      BuildContext context) async {
    final body = {
      "mobile_no": mobile_no,
      "email": email,
      "os": os,
      "phone_model": model,
      "lat": latitude,
      "long": longitude,
      "install_location": install_location,
      "code_name": "",
      "password": password
    };

    final response = await http.post(
      Uri.parse(
          'http://165.22.219.135/geniemoney/public/index.php/appregister'),
      body: body,
    );

    if (response.statusCode == 201) {
      var response_server = jsonDecode(response.body);

      if (kDebugMode) {
        print(response_server);
      }

      if (response_server["status"] == 201) {
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

  Future<Login_model> fetchLoginPosts(String username, String password,
      String otp, BuildContext context) async {
    final body = {"username": username, "password": password, "otp": otp};

    final response = await http.post(
      Uri.parse('http://165.22.219.135/geniemoney/public/index.php/applogin'),
      body: body,
    );

    if (response.statusCode == 201) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['status'] == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString("userid", response_server['userdetail']['userid']);
        await prefs.setString("name", response_server['userdetail']['name']);
        await prefs.setString("email", response_server['userdetail']['email']);
        await prefs.setString("phone", response_server['userdetail']['phone']);
        
        _createToast("Login Successful");
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const Home(),
          ),
              (route) => false,
        );
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

  Future<Generate_otp> generateOtp(
      String username, String password, BuildContext context) async {
    final body = {"username": username, "password": password};

    final response = await http.post(
      Uri.parse(
          'http://165.22.219.135/geniemoney/public/index.php/appotp'),
      body: body,
    );

    if (response.statusCode == 201) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['status'] == 201) {
        if (username.isNotEmpty) {
          _createToast("OTP Sent to " + username);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(username, password)));
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

  Future<Generate_otp> resendOtp(String username, String password, BuildContext context) async {
    final body = {"username": username, "password": password};

    final response = await http.post(
      Uri.parse(
          'http://165.22.219.135/geniemoney/public/index.php/appotp'),
      body: body,
    );

    if (response.statusCode == 201) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['status'] == 201) {
        if (username.isNotEmpty) {
          _createToast("OTP Sent to " + username);
        } else {
          _createToast("OTP Sent to " + username);
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
