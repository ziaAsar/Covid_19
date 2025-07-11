import 'package:covid_19/View/World_States.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/Splash_Screen.dart';
import 'View/countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}

