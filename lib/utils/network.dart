import 'dart:convert';
import 'dart:js';

import 'package:genie_shield/Model/registration_model.dart';
import 'package:http/http.dart' as http;

class NetworkCall {

  Future<RegistrationModel> fetchPosts(JsObject request) async {
    final response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    body: request
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return RegistrationModel.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}