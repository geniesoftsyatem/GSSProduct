import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:genie_money/Model/generate_otp.dart';
import 'package:genie_money/Model/login_model.dart';
import 'package:genie_money/Model/registration_model.dart';
import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/Screens/otp_screen.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/utils/constants.dart';
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
      String usertype,
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
      "password": password,
      "usertype": usertype
    };

    final response;

    if (usertype == "Customer") {
      response = await http.post(
        Uri.parse(
            'http://165.22.219.135/geniemoney/public/index.php/appregister'),
        body: body,
      );
    } else {
      response = await http.post(
        Uri.parse(
            'http://165.22.219.135/geniemoney/public/index.php/appcompanyregister'),
        body: body,
      );
    }

    var response_server = jsonDecode(response.body);

    if (kDebugMode) {
      print(response_server);
    }

    if (response.statusCode == 201) {
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
      if (response.statusCode == 404) {
        _createToast("Email Or Phone number already exist");
      } else {
        _createToast("Failed to register User");
      }
      throw Exception('Failed to load album');
    }
  }

  Future<Login_model> fetchLoginPosts(String username, String password,
      String otp, String type, BuildContext context) async {
    final body = {"username": username, "password": password, "otp": otp};

    final response;

    if (type == "Customer") {
      response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/applogin'),
        body: body,
      );
    } else {
      response = await http.post(
        Uri.parse(
            'http://165.22.219.135/geniemoney/public/index.php/appcompanylogin'),
        body: body,
      );
    }

    final response_server = json.decode(response.body);
    if (kDebugMode) {
      print(response_server);
    }

    if (response.statusCode == 201) {
      if (response_server['status'] == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Constants.userid = response_server['userdetail']['userid'];
        Constants.name = response_server['userdetail']['name'];
        Constants.email = response_server['userdetail']['email'];
        Constants.phone = response_server['userdetail']['phone'];
        Constants.type = type;
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString("userid", Constants.userid);
        await prefs.setString("name", Constants.name);
        await prefs.setString("email", Constants.email);
        await prefs.setString("phone", Constants.phone);
        await prefs.setString("type", Constants.type);

        _createToast("Login Successful");
        if (type == "Employee") {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => PortfolioScreen(type),
            ),
                (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const Home(),
            ),
                (route) => false,
          );
        }

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

  Future<Generate_otp> generateOtp(String username, String password,
      String type, BuildContext context) async {
    final body = {"username": username, "password": password};

    final response;

    if (type == "customer") {
      response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/appotp'),
        body: body,
      );
    } else {
      response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/appcompanyotp'),
        body: body,
      );
    }

    final response_server = json.decode(response.body);
    if (kDebugMode) {
      print(response_server);
    }

    if (response.statusCode == 201) {
      if (response_server['status'] == 201) {
        if (username.isNotEmpty) {
          _createToast("OTP Sent to " + username);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(username, password, type)));
        }
        return Generate_otp.fromJson(json.decode(response.body));
      } else {
        if (username.isNotEmpty) {
          _createToast("OTP Sent to " + username);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(username, password, type)));
        }
        // _createToast(response_server["messages"]);
        throw Exception('Failed to load album');
      }
    } else {
      if (username.isNotEmpty) {
        _createToast("OTP Sent to " + username);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPScreen(username, password, type)));
      }
      // _createToast("Login Failed");
      throw Exception('Failed to load album');
    }
  }

  Future<Generate_otp> resendOtp(
      String username, String password, BuildContext context) async {
    final body = {"username": username, "password": password};

    final response = await http.post(
      Uri.parse('http://165.22.219.135/geniemoney/public/index.php/appotp'),
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

  Future<Pincode_model> getStateAndCity(
      String pincode, BuildContext context) async {
    final response = await http.get(
      Uri.parse('http://www.postalpincode.in/api/pincode/' + pincode),
    );

    if (response.statusCode == 200) {
      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }
      if (response_server['Status'] == "Success") {
        return Pincode_model.fromJson(json.decode(response.body));
      } else {
        _createToast("Something went wrong");
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Something went wrong");
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
