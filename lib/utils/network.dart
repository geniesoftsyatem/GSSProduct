import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:genie_money/Model/personal_details_model.dart';
import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/bank_details_model.dart';
import '../Model/employment_details_model.dart';
import '../home.dart';

class NetworkCall {

  Future<bool> isNetworkConnected() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup("www.google.com");
      if (result.isNotEmpty && result[0].address.isNotEmpty) {
        isConnected = true;
      } else {
        isConnected = false;
      }
    } on SocketException catch (exception) {
      isConnected = false;
      print(exception);
    }
    return isConnected;
  }

  Future<bool> fetchRegistrationPosts(
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

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
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
          return true;
        } else {
          _createToast("Failed to register User");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Email Or Phone number already exist");
        } else {
          _createToast("Failed to register User");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<bool> fetchLoginPosts(String username, String password,
      String otp, String type, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
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

          return true;
        } else {
          if (response_server['status'] == 404) {
            _createToast(response_server["messages"]["error"]);
          } else {
            _createToast("Something wend wrong");
          }
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          _createToast(response_server["messages"]["error"]);
        } else {
          _createToast("Something wend wrong");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<bool> generateOtp(String username, String password,
      String type, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {"username": username, "password": password};

      final response;

      if (type == "Customer") {
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
          }
          return true;
        } else {
          _createToast("Login Failed");
          return false;
        }
      } else {
        if (response.statusCode == 404) {
          // String msg = ;
          // final message = jsonDecode(msg);
          _createToast(response_server["messages"]["error"]);
        } else {
          _createToast("Something went wrong");
        }
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<bool> resendOtp(
      String username, String password, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
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
          return true;
        } else {
          _createToast("Login Failed");
          return false;
        }
      } else {
        _createToast("Login Failed");
        return false;
      }
    } else {
      _createToast("Please connect to internet");
      return false;
    }
  }

  Future<Pincode_model> getStateAndCity(
      String pincode, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
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
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<PersonalDetailsModel> getPersonalDetails() async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {

      final response = await http.get(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/getpersonalinfo?userid=' + Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {

          return PersonalDetailsModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_profile(var basicInfo, var residentialinfo, var references, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {
        "userid": Constants.userid,
        "basicinfo": jsonEncode(basicInfo),
        "residentialinfo" : jsonEncode(residentialinfo),
        "references" : jsonEncode(references)
      };

      final response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/updatepersonalinfo'),
        body: body,
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          _createToast("Details Updated Successfully");
          Route newRoute = MaterialPageRoute(builder: (context) => const Home());
          Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<EmploymentDetailsModel> getEmploymentDetails() async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {

      final response = await http.get(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/getemploymentdetail?userid=' + Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {

          return EmploymentDetailsModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_employment(var employmentdetail, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {
        "userid": Constants.userid,
        "employmentdetail": jsonEncode(employmentdetail)
      };

      final response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/updatemploymentdetail'),
        body: body,
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          _createToast("Details Updated Successfully");
          Route newRoute = MaterialPageRoute(builder: (context) => const Home());
          Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<void> update_bank(var bankDetails, BuildContext context) async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {
      final body = {
        "userid": Constants.userid,
        "bankdetail": jsonEncode(bankDetails)
      };

      final response = await http.post(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/updatbankdetail'),
        body: body,
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {
          _createToast("Details Updated Successfully");
          Route newRoute = MaterialPageRoute(builder: (context) => const Home());
          Navigator.of(context).pushAndRemoveUntil(newRoute, (route) => false);
        } else {
          _createToast("Failed to update Details");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("Failed to update Details");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
      throw Exception('Failed to load album');
    }
  }

  Future<BankDetailsModel> getbankDetails() async {

    bool isConnected = await isNetworkConnected();

    if (isConnected) {

      final response = await http.get(
        Uri.parse('http://165.22.219.135/geniemoney/public/index.php/getbankdetail?userid=' + Constants.userid),
      );

      final response_server = json.decode(response.body);
      if (kDebugMode) {
        print(response_server);
      }

      if (response.statusCode == 201) {
        if (response_server['status'] == 201) {

          return BankDetailsModel.fromJson(json.decode(response.body));
        } else {
          _createToast("No Data Found");
          throw Exception('Failed to load album');
        }
      } else {
        if (response.statusCode == 404) {
          _createToast("No Data Found");
        } else {
          _createToast("Something went wrong");
        }
        throw Exception('Failed to load album');
      }
    } else {
      _createToast("Please connect to internet");
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
