import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
          "Terms & Conditions",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xffE0712D)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Last Updated: March 2026",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            SizedBox(height: 20),

            Text(
              "Welcome to our Food Service platform. By accessing or using our "
                  "website or mobile application, you agree to comply with the "
                  "following Terms and Conditions.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "1. Use of Service",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "You agree to use our platform only for lawful purposes. "
                  "Any misuse of the service, including fraudulent orders "
                  "or harmful activities, is strictly prohibited.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "2. Account Responsibility",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Users are responsible for maintaining the confidentiality "
                  "of their account credentials and for all activities "
                  "that occur under their account.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "3. Orders and Payments",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "All food orders placed through our platform are subject "
                  "to availability and confirmation by the restaurant. "
                  "Payments must be completed using the available payment methods.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "4. Cancellation Policy",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "Orders may be canceled within a limited time before "
                  "preparation begins. Once the restaurant starts preparing "
                  "the order, cancellation may not be possible.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "5. Limitation of Liability",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We are not responsible for delays, service interruptions, "
                  "or issues caused by restaurants, delivery partners, "
                  "or external factors beyond our control.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 25),

            Text(
              "6. Changes to Terms",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              "We may update these Terms and Conditions at any time. "
                  "Changes will be posted on this page with the updated date.",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}