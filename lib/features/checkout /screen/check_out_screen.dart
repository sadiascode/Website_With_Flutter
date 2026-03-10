import 'package:flutter/material.dart';


class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});


  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 20),

                const Text(
                  "Customer Information",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "First Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Enter first name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Last Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Mobile Number",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 12),

                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: "Shipping Address",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 25),


                Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: const [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal"),
                            Text("৳450"),
                          ],
                        ),

                        SizedBox(height: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Fee"),
                            Text("৳50"),
                          ],
                        ),

                        Divider(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "৳500",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 50,

                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Checkout button pressed"),
                          ),
                        );
                      }
                    },

                    child: const Text(
                      "Place Order",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}