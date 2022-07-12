import 'package:fakestore/src/screens/login_screen.dart';
import 'package:fakestore/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void setupLocator() {
    if (!GetIt.I.isRegistered<ApiService>()) {
      GetIt.I.registerLazySingleton(
        () => ApiService(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    setupLocator();
    return MaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
