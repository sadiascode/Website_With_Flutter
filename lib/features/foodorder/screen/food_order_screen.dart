import 'package:flutter/material.dart';

class FoodOrderScreen extends StatelessWidget {
  const FoodOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Order'),
        backgroundColor: const Color(0xff2F2F2F),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Food Order Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
