import 'package:flutter/material.dart';

import '../../commo/custom_button.dart';

class PaymentPopup extends StatefulWidget {

  final double totalPrice;

  const PaymentPopup({super.key, required this.totalPrice});

  @override
  State<PaymentPopup> createState() => _PaymentPopupState();
}

class _PaymentPopupState extends State<PaymentPopup> {

  final cardNumber = TextEditingController();
  final cardHolder = TextEditingController();
  final expiry = TextEditingController();
  final cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: SingleChildScrollView(
        child: Column(

          children: [

            const Text(
              "Card Payment",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cardNumber,
              decoration: InputDecoration(
                hintText: "Card Number",
                prefixIcon: const Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: cardHolder,
              decoration: InputDecoration(
                hintText: "Card Holder Name",
                prefixIcon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [

                Expanded(
                  child: TextField(
                    controller: expiry,
                    decoration: InputDecoration(
                      hintText: "MM/YY",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: TextField(
                    controller: cvv,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "CVV",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: "Pay \$${widget.totalPrice.toStringAsFixed(2)}",
              onTap: () {

                Navigator.pop(context);

                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      icon: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 40,
                      ),
                      title: const Text("Payment Successful"),
                      content: const Text("Your order has been placed."),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Center(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Color(0xffE0712D)),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );

              },
            )
          ],
        ),
      ),
    );
  }
}
