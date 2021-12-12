import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_shield/Model/registration_model.dart';
import 'package:http/http.dart' as http;

class NetworkCall {
  Future<RegistrationModel> fetchPosts(String email, String mobile_no,
      String password, BuildContext context) async {
    final response = await http.post(
      Uri.parse(
          'http://143.110.176.111/genieshield/index.php/Api/user_registeration'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "alt_mobile_no": mobile_no,
        "password": password,
        "code": "",
        "code_name": ""
      }),
    );

    if (response.statusCode == 200) {

     // String response_server = json.decode(response.body);

      _createToast("User registered successfully, Please login");
      Navigator.of(context).pop();
      return RegistrationModel.fromJson(json.decode(response.body));
    } else {
      _createToast("Failed to register User");
      throw Exception('Failed to load album');
    }
  }

  // Future<RegistrationModel> fetchPosts(String email, String mobile_no,
  //     String password, BuildContext context) async {
  //   final response = await http.post(
  //     Uri.parse(
  //         'http://143.110.176.111/genieshield/index.php/Api/user_registeration'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "email": email,
  //       "alt_mobile_no": mobile_no,
  //       "password": password,
  //       "code": "",
  //       "code_name": ""
  //     }),
  //   );
  //
  //   if (response.statusCode == 200) {
  //     _createToast("User registered successfully, Please login");
  //     Navigator.of(context).pop();
  //     return RegistrationModel.fromJson(json.decode(response.body));
  //   } else {
  //     _createToast("Failed to register User");
  //     throw Exception('Failed to load album');
  //   }
  // }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
