import 'dart:convert';

import 'package:fakestore/src/model/login.dart';
import 'package:fakestore/src/model/products.dart';
import 'package:http/http.dart' as http;

import '../model/cart.dart';
// import '../model/cart_update.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-Type': 'application/json'};

  Future<dynamic> login(String name, String password) {
    final login = Login(username: name, password: password);
    return http
        .post(Uri.parse("$baseUrl/auth/login"), body: login.toJson())
        .then((data) {
      final jsonData = json.decode(data.body);

      return jsonData;
    }).catchError((error) => print(error));
  }

  Future<List<Product>> getAllProducts() {
    final products = <Product>[];
    return http
        .get(Uri.parse('$baseUrl/products'), headers: headers)
        .then((data) {
      final jsonData = json.decode(data.body);

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

  Future<List<Product>> getProductsByCategory(String categoryName) {
    final products = <Product>[];
    return http
        .get(Uri.parse('$baseUrl/products/category/$categoryName'))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((error) => print(error));
  }

  Future<List<String>> getAllCategories() {
    final categories = <String>[];
    return http.get(Uri.parse('$baseUrl/products/categories')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        for (var category in jsonData) {
          categories.add(category);
        }
      }
      return categories;
    }).catchError((error) => print(error));
  }

  Future<void> updateCart(int cartId, String userId, int productId) {
    return http
        .put(Uri.parse('$baseUrl/carts/$cartId'),
            headers: headers,
            body: jsonEncode(<String, dynamic>{
              "userId": cartId,
              "date": DateTime.now().toIso8601String(),
              "products": [
                {"productId": productId, "quantity": 1}
              ]
            }))
        .then((data) {
      if (data.statusCode == 200) {
        print(data.body);
        print("cart updated");
      }
    }).catchError((error) => print(error));
  }

  Future<void> deleteCart(String cartId) {
    return http.delete(Uri.parse('$baseUrl/carts/$cartId')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    }).catchError((error) => print(error));
  }

  Future<Cart?> getCart(String id) {
    return http
        .get(Uri.parse('$baseUrl/carts/$id'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return Cart.fromJson(jsonData);
      }
      return null;
    }).catchError((err) => print(err));
  }
}
