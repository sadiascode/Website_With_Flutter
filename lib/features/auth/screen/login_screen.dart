import 'package:flutter/material.dart';
import 'package:foodservice/features/commo/custom_button.dart';
import '../../commo/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/burger.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Center(
                      child: Text(
                        "Welcome to FoodService Website",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      "User Name",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 6),

                    const CustomTextfield(
                      hintText: "Enter your name",
                      textColor: Colors.white,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "User Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 6),

                    const CustomTextfield(
                      hintText: "Enter your Password",
                      isPassword: true,
                      textColor: Colors.white,
                    ),

                    const SizedBox(height: 25),

                    CustomButton(
                      text: "Login",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}