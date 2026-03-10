import 'package:flutter/material.dart';
import 'package:foodservice/features/commo/custom_button.dart';
import 'check_out_screen.dart';

class ViewCartScreen extends StatefulWidget {

  final String name;
  final double price;
  final String image;

  const ViewCartScreen({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<ViewCartScreen> createState() => _ViewCartScreenState();
}

class _ViewCartScreenState extends State<ViewCartScreen> {

  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();

    cartItems.add({
      "name": widget.name,
      "price": widget.price,
      "qty": 1,
      "image": widget.image
    });
  }

  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item["price"] * item["qty"];
    }
    return total;
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
          "Your Cart",
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
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {

                var item = cartItems[index];

                return Card(
                    color:  Color(0xFFFFF0E6),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),

                  child: Padding(
                    padding: const EdgeInsets.all(10),

                    child: Row(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item["image"],
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [

                              Text(
                                item["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                "\$${item["price"]}",
                                style: const TextStyle(
                                  color: Color(0xffE0712D),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [

                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  if (item["qty"] > 1) {
                                    item["qty"]--;
                                  }
                                });
                              },
                            ),

                            Text(item["qty"].toString()),

                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  item["qty"]++;
                                });
                              },
                            ),
                          ],
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete,
                              color: Colors.red),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    color: Colors.black12)
              ],
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xffE0712D),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(height: 15),
                CustomButton(text: "Proceed to Checkout", onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  CheckOutScreen(totalPrice: totalPrice,),
                    ),
                  );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}