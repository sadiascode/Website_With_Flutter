import 'package:flutter/material.dart';

class PrivecyScreen extends StatelessWidget {
  const PrivecyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE0712D),
            size: 18,
          ),
        ),
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Last Updated: March 2026",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 20),

            Text(
              "Welcome to our Food Service platform. Your privacy is important to us. "
                  "This Privacy Policy explains how we collect, use, and protect your information "
                  "when you use our website and mobile application.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "1. Information We Collect",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "• Personal information such as name, email, phone number, and delivery address.\n"
                  "• Account information like login credentials.\n"
                  "• Order details about food you purchase.\n"
                  "• Device information such as IP address and browser type.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "2. How We Use Your Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We use your information to process orders, manage your account, "
                  "improve our services, communicate with you, and maintain platform security.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "3. Sharing of Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We do not sell your personal data. However, information may be shared "
                  "with restaurants, delivery partners, or service providers to complete your orders.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "4. Data Security",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We use appropriate security measures to protect your personal data "
                  "from unauthorized access or misuse.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "5. Your Rights",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "You may request access, correction, or deletion of your personal data "
                  "by contacting our support team.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}