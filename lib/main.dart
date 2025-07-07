import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistapp/feature/feature_splash/bilding/splash_bindings.dart';
import 'package:todolistapp/feature/feature_splash/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'todolistapp',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: SplashBindings(),
    );
  }
}
