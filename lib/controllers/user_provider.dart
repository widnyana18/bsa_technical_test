import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:form_input/model/user.dart';

class UserProvider {
  List<User> userData = [];

  Future<List<User>> getData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      var data = jsonDecode(response.body) as List<dynamic>;

      if (response.statusCode == 200) {
        for (Map<String, dynamic> index in data) {
          userData.add(User.fromJson(index));
        }
        return userData;
      }
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}
