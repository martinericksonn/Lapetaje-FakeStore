import 'package:fakestore/src/app.dart';
import 'package:fakestore/src/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/screens/login_screen.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => ApiService());
}

// This widget is the root of your application.
@override
void main() {
  setupLocator();
  runApp(const MyApp());
}
