import 'dart:convert';

import 'package:fakestore/src/model/products.dart';
import 'package:http/http.dart' as http;

import '../model/cart.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-Type': 'application/json'};

  Future<dynamic> login(String name, String password) {
    return http
        .post(Uri.parse("$baseUrl/auth/login"),
            headers: headers,
            body: json.encode({"username": name, "password": password}))
        .then((data) {
      final jsonData = json.decode(data.body);

      return jsonData;
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

  Future<Product> getProduct(int id) {
    return http
        .get(Uri.parse('$baseUrl/products/$id'), headers: headers)
        .then((data) {
      final jsonData = json.decode(data.body);
      return Product.fromJson(jsonData);
    }).catchError((error) {
      print(error);
    });
  }

  Future<Product> updateCart(int productId, String userId) {
    return http
        .put(Uri.parse("$baseUrl/carts"),
            headers: headers,
            body: json.encode({
              "userId": userId,
              "date": DateTime.now(),
              "products": [
                {"productId": productId, "quantity": 1}
              ]
            }))
        .then((data) {
      final jsonData = json.decode(data.body);

      return Product.fromJson(jsonData);
    }).catchError((error) => print(error));
  }

  // Future<Product> deleteCart(String productId) {
  //   return http
  //       .put(Uri.parse("$baseUrl/carts"),
  //           headers: headers,
  //           body: json.encode({
  //             "userId": userId,
  //             "date": DateTime.now(),
  //             "products": [
  //               {"productId": productId, "quantity": 1}
  //             ]
  //           }))
  //       .then((data) {
  //     final jsonData = json.decode(data.body);

  //     return Product.fromJson(jsonData);
  //   }).catchError((error) => print(error));
  // }

  // Future<Cart> getCart(
  //   String cartId,
  // ) {
  //   return Cart();
  //   // return http
  //   //     .put(Uri.parse("$baseUrl/carts"),
  //   //         headers: headers,
  //   //         body: json.encode({
  //   //           "userId": cartId,
  //   //           "date": DateTime.now(),
  //   //           "products": [
  //   //             {"productId": cartId, "quantity": 1}
  //   //           ]
  //   //         }))
  //   //     .then((data) {
  //   //   final jsonData = json.decode(data.body);

  //   //   return Product.fromJson(jsonData);
  //   // }).catchError((error) => print(error));
  // }
}
