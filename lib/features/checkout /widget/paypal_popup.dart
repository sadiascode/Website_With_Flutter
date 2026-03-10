import 'package:flutter/material.dart';

import '../../commo/custom_button.dart';

class PaypalPopup extends StatefulWidget {

  final double totalPrice;

  const PaypalPopup({super.key, required this.totalPrice});

  @override
  State<PaypalPopup> createState() => _PaypalPopupState();
}

class _PaypalPopupState extends State<PaypalPopup> {

  final paypalEmail = TextEditingController();
  final paypalPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const Text(
            "PayPal Payment",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: paypalEmail,
            decoration: InputDecoration(
              hintText: "PayPal Email",
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          const SizedBox(height: 12),

          TextField(
            controller: paypalPassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
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
    );
  }
}