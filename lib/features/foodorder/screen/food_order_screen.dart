import 'package:flutter/material.dart';

import '../../history/widget/custom_history.dart';

class FoodOrderScreen extends StatelessWidget {
  const FoodOrderScreen({super.key});

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
          "Food Order",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: const Color(0xffFFFAF7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    insetPadding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Clear Food Order",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),
                          const Text(
                            "Are you sure you want to clear all your food order?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Clear",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text(
              "Clear All",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  children: [
                  const SizedBox(height: 10),
                    CustomHistory(
                      title: "Cheese Burger Order",
                      subtitle: "Preparing...",
                      imageUrl: "assets/pnh.jpg",
                      date: "Today",
                    ),

                    CustomHistory(
                      title: "Veggie Pizza Order",
                      subtitle: "Order Completed",
                      imageUrl: "assets/pizza.png",
                      date: "Yesterday",
                    ),

                    CustomHistory(
                      title: "Grilled Chicken Order",
                      subtitle: "Order Completed",
                      imageUrl: "assets/grilled.webp",
                      date: "10 May",
                    ),

                    CustomHistory(
                      title: "Pasta Alfredo Order",
                      subtitle: "Order Completed",
                      imageUrl: "assets/pasta.jpg",
                      date: "9 May",
                    ),

                    CustomHistory(
                      title: "Caesar Salad Order",
                      subtitle: "Order Completed",
                      imageUrl: "assets/caesar.jpg",
                      date: "7 May",
                    ),
              ]
              )
            ),

      )
    );
  }
}
