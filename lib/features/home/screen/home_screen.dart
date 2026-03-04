import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodservice/features/home/widget/dashboard_layout.dart';
import '../widget/custom_mini_button.dart';
import '../widget/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff2F2F2F),
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          children: [
            const SizedBox(width: 12),
            SvgPicture.asset(
              "assets/logo.svg",
              height: 55,
              width: 85,
            ),

            const SizedBox(width: 22),

            const Expanded(
              child: CustomSearch(),
            ),

            const SizedBox(width: 12),

            CustomMiniButton(
              text: "Log Out",
              textcolor: Colors.white,
              backgroundColor: const Color(0xffE0712D),
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: const Color(0xffE0712D).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.logout_rounded,
                                color: Color(0xffE0712D),
                                size: 30,
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Confirm Logout",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "Are you sure you want to log out from your account?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 25),

                            Row(
                              children: [

                                Expanded(
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(color: Colors.grey),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffE0712D),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      print("User Logged Out");
                                    },
                                    child: const Text("Logout",style: TextStyle(color: Colors.white),),
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
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          SizedBox(height: 10),
          const FoodServiceSidebar(),
          Expanded(
            child: Container(
              color: const Color(0xFFFFFAF7),

            ),
          ),
        ],
      ),
    );
  }
}