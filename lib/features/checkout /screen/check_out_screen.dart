import 'package:flutter/material.dart';
import 'package:foodservice/features/commo/custom_button.dart';

import '../widget/payment_popup.dart';
import '../widget/paypal_popup.dart';

class CheckOutScreen extends StatefulWidget {
  final double totalPrice;

  const CheckOutScreen({super.key, required this.totalPrice});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  int selectedPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),

      appBar: AppBar(
        centerTitle: true,
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
          "Payment",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Total Amount
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF0E6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "\$${widget.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffE0712D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Payment Method",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            paymentTile(0, Icons.credit_card, "Credit / Debit Card"),
            paymentTile(1, Icons.account_balance_wallet, "Paypal"),
            paymentTile(2, Icons.money, "Cash on Delivery"),

            const Spacer(),

            CustomButton(
              text: "Pay Now",
              onTap: () {
                showSuccessDialog();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget paymentTile(int index, IconData icon, String title) {

    return GestureDetector(
      onTap: () {

        setState(() {
          selectedPayment = index;
        });

        //Credit Card Popup
        if(index == 0){

          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 420,
                  child: PaymentPopup(
                    totalPrice: widget.totalPrice,
                  ),
                ),
              );
            },
          );
        }

        // PayPal Popup
        if(index == 1){

          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  height: 320,
                  child: PaypalPopup(
                    totalPrice: widget.totalPrice,
                  ),
                ),
              );
            },
          );

        }

        // Cash On Delivery Popup
        if(index == 2){

          showDialog(
            context: context,
            builder: (context){
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(24),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      const Icon(
                        Icons.delivery_dining,
                        color: Color(0xffE0712D),
                        size: 55,
                      ),

                      const SizedBox(height: 15),

                      const Text(
                        "Cash on Delivery",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "You will pay when the order arrives at your door.",
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20),

                      CustomButton(
                        text: "Confirm Order",
                        onTap: (){
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }

      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: selectedPayment == index
              ? const Color(0xFFFFF0E6)
              : Colors.white,

          borderRadius: BorderRadius.circular(10),

          border: Border.all(
            color: selectedPayment == index
                ? const Color(0xffE0712D)
                : Colors.grey.shade300,
          ),
        ),

        child: Row(
          children: [

            Icon(icon, color: const Color(0xffE0712D)),

            const SizedBox(width: 12),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            if (selectedPayment == index)
              const Icon(
                Icons.check_circle,
                color: Color(0xffE0712D),
              )
          ],
        ),
      ),
    );
  }

  void showSuccessDialog(){

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60,
                ),

                const SizedBox(height: 15),

                const Text(
                  "Order Successful",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Your order has been placed successfully.",
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                CustomButton(
                  text: "Back to Home",
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}