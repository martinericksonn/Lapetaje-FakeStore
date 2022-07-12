import 'dart:convert';

import 'package:fakestore/src/model/products.dart';
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
      print(data.body);
      print(data.body[0]);
      return data.body;
    }).catchError((error) => print(error));
  }

  Future<List<Product>> getAllProducts() {
    return http
        .get(Uri.parse('$baseUrl/products'), headers: headers)
        .then((data) {
      final jsonData = json.decode(data.body);
      final products = <Product>[];

      for (var item in jsonData) {
        products.add(Product.fromJson(item));
      }
      print(products);
      return products;
    }).catchError((error) {
      print(error);
    });
  }
}
