import 'package:flutter/material.dart';
import 'package:foodservice/features/auth/screen/login_screen.dart';
import 'package:foodservice/features/splash/splash_screen.dart';

class FoodService extends StatelessWidget {
  const FoodService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Service",
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}