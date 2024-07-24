import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:form_input/model/user.dart';

class UserProvider {
  static Future<List<User>> getData() async {
    List<User> userData = [];

    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body.toString());

      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          userData.add(User.fromJson(index));
        }
        return userData;
      }
      return userData; //empty list
    } catch (e) {
      rethrow;
    }
  }
}
