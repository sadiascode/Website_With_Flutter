import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xFFFFFAF7),

        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Chat",
            style: TextStyle(
              color: Color(0xffE0712D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    children: [
                    const SizedBox(height: 15),
              ]
            )
            )
        )
    );
  }
}
