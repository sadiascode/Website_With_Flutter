import 'package:flutter/material.dart';

class CustomNew extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;

  const CustomNew({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,  // Fixed height
        width: double.infinity,  // Full width
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),  // Fixed border radius
          border: const Border(
            left: BorderSide(color: Color(0xffE0712D), width: 5),
            top: BorderSide(color: Color(0xffE0712D), width: 1),
            right: BorderSide(color: Color(0xffE0712D), width: 1),
            bottom: BorderSide(color: Color(0xffE0712D), width: 1),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),  // Fixed padding
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,  // Fixed font size
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}