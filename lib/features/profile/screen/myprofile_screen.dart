import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/custom_medium.dart';
import '../widget/custom_txt.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {

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
            "My Profile",
            style: TextStyle(
              color: Color(0xffE0712D),
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: 293,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 170,
                            height: 170,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Icon(
                                          Icons.person,
                                          size: 150,
                                          color: Colors.grey[600],
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF5F0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Color(0xffE0712D),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              CustomMedium(text: "Profile Info", onTap: () {}),
              SizedBox(height: 15),
              const SizedBox(height: 15),
              CustomTxt(
                title: "Full Name:",
                subtitle:'Sadia',
              ),
              const SizedBox(height: 5),
              CustomTxt(title: "Email:", subtitle:  'rahmanrohasadia@gmail.com'),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Address:",
                subtitle: 'Bogura',
              ),

              SizedBox(height: 20),
              CustomMedium(text: "Other Info", onTap: () {}),

              const SizedBox(height: 15),
              CustomTxt(
                title: "Age:",
                subtitle: '23',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Health condition:",
                subtitle: 'Great',
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Wakeup time:",
                subtitle: "7:15 AM",
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Breakfast time:",
                subtitle: "No Breakfast",
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Lunch time:",
                subtitle: "Ramadan Time",
              ),
              const SizedBox(height: 5),
              CustomTxt(
                title: "Dinner time:",
                subtitle: " 10:00PM",
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}