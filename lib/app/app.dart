import 'package:flutter/material.dart';
import 'package:foodservice/features/home/screen/home_screen.dart';


class FoodService extends StatelessWidget {
  const FoodService({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Service",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}