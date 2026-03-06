import 'package:flutter/material.dart';
import 'package:foodservice/features/message/widget/custom_text.dart';

class ChatScreen extends StatefulWidget {
  final bool isActive;
  const ChatScreen({super.key, this.isActive = false});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _textController = TextEditingController();
  bool _isTyping = false;

  void _addMessage(String text, bool isUser) {
    setState(() {
      messages.add({
        "text": text,
        "isUser": isUser,
      });
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    
    _addMessage(text, true);
    _textController.clear();
    
    setState(() {
      _isTyping = true;
    });
    
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isTyping = false;
      });
      _addMessage("Thanks for your message! Allow me sometime.", false);
    });
  }

  @override
  Widget build(BuildContext context) {
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

      body: Column(
        children: [

          Expanded(
            child: Column(
              children: [

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: messages.length + (_isTyping ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == messages.length && _isTyping) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Text(
                              "Typing...",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        );
                      }
                      
                      if (index >= messages.length) return const SizedBox.shrink();
                      
                      final message = messages[index];
                      final isUser = message["isUser"] as bool;
                      
                      return Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                          decoration: BoxDecoration(
                            color: isUser ? const Color(0xFFE0712D) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Text(
                            message["text"] as String,
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          SafeArea(child: CustomText(
            controller: _textController,
            onSend: _sendMessage,
          )),
        ],
      ),
    );
  }
}