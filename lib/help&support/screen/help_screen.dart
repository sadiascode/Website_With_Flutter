import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
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
              "Help & Support",
            style: TextStyle(
              color: Color(0xffE0712D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: const [

            Text(
              "Frequently Asked Questions",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                 color: Color(0xffE0712D),
              ),
            ),

            SizedBox(height: 20),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("How to order food?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Select food → Add to cart → Checkout to confirm your order.",
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("How long does delivery take?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Delivery normally takes 30-45 minutes.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("Can I cancel my order?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Yes, you can cancel before restaurant preparation starts.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("What payment methods are accepted?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "We accept card, mobile banking and cash on delivery.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("How can I track my order?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Go to the Orders section and select your order to see tracking details.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("What if my order is late?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "If your order is delayed, please check the order status or contact support.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("What if I receive the wrong item?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Please report the issue from the Orders section and our support team will assist you.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 10),

            Card(
              elevation: 2,
              color: Color(0xffE0712D),
              child: ExpansionTile(
                title: Text("How can I request a refund?",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Refund requests can be submitted from the order details page.",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}