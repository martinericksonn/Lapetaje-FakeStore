import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-Type': 'application/json'};
  Future<dynamic> login(String name, String password) {
    return http
        .post(Uri.parse("$baseUrl/auth/login"),
            headers: headers,
            body: json.encode({"username": name, "password": password}))
        .then((data) {
      ;
      print(data.body);

      return data.body;
    }).catchError((error) => print(error));
  }
}
