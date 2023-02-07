import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      Response response = await post(Uri.parse('https://reqres.in//api/login'));
      body:
      json.encode({
        'email': email,
        'password': password,
      });

      // body:{
      //  'email':email,
      //  'password' : password,
      // }
    } catch (e) {
      print(e.toString());
    }
  }
}
