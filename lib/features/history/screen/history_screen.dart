import 'package:flutter/material.dart';

import '../widget/custom_history.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
          "Order History",
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
                            "Clear Order History",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 16),
                          const Text(
                            "Are you sure you want to clear all your order history?",
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
                    title: "Le Bernardin",
                    subtitle: "Cheese Burger",
                    imageUrl:"assets/resturant1.jpg",
                    date: "Today",
                  ),

                  CustomHistory(
                    title: "The French Laundry",
                    subtitle: "6 Items",
                    imageUrl: "assets/resturant2.jpg",
                    date: "Yesterday",
                  ),

                  CustomHistory(
                    title: "Per Se",
                    subtitle: "Veggie Pizza",
                    imageUrl: "assets/resturant3.jpg",
                    date: "16 Mar",
                  ),

                  CustomHistory(
                    title: "Osteria Francescana",
                    subtitle: "2 Items",
                    imageUrl: "assets/resturant4.webp",
                    date: "17 Mar",
                  ),
            ]
            )
          )
        ),
    );
  }
}
