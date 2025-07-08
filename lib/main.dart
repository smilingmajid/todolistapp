import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/splash_screen.dart';
import 'bindings/my_bindings.dart';

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
      initialBinding: MyBindings(),
    );
  }
}
