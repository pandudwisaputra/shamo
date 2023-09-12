import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://178.128.62.145/api';

  Future<UserModel> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'username': username,
      'password': password,

      // '_token':
    });

    var response = await http.post(url, headers: headers, body: body);

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    Uri url = Uri.parse('$baseUrl/login');
    var body = {
      'email': email,
      'password': password,
    };

    var response = await http.post(url, body: body);

    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
