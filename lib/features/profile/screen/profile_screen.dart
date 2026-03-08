import 'package:flutter/material.dart';
import '../../commo/custom_button.dart';
import '../widget/custom_edit.dart';
import '../widget/custom_minibutton.dart';
import '../widget/custom_new.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

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
          "Profile",
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

              const SizedBox(height: 15),

              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenWidth * 0.02,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.03),

                    border: const Border(
                      left: BorderSide(color: Color(0xffE0712D), width: 5),
                      top: BorderSide(color: Color(0xffE0712D), width: 1),
                      right: BorderSide(color: Color(0xffE0712D), width: 1),
                      bottom: BorderSide(color: Color(0xffE0712D), width: 1),
                    ),
                  ),

                  child: Row(
                    children: [

                      ClipOval(
                        child: Builder(
                          builder: (context) {
                            print('Local image load error');

                            return Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey[600],
                            );
                          },
                        ),
                      ),

                      SizedBox(width: screenWidth * 0.03),

                      Expanded(
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        size: screenWidth * 0.045,
                        color: const Color(0xffE0712D),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              CustomNew(
                text: "Change Password",
                onTap: () {

                  showDialog(
                    context: context,

                    builder: (context) {

                      return AlertDialog(

                        backgroundColor: const Color(0xFFFFFAF7),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),

                        content: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,

                          child: Column(
                            mainAxisSize: MainAxisSize.min,

                            children: [

                              CustomEdit(
                                title: "Current Password",
                                hintText: "**************",
                              ),

                              const SizedBox(height: 10),

                              CustomEdit(
                                title: "New Password",
                                hintText: "**************",
                              ),

                              const SizedBox(height: 10),

                              CustomEdit(
                                title: "Retype New Password",
                                hintText: "**************",
                              ),

                              const SizedBox(height: 15),

                            ],
                          ),
                        ),

                        actions: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                            children: [

                              CustomMinibutton(
                                text: 'Yes',
                                textcolor: Colors.white,
                                onTap: () {},
                                backgroundColor: const Color(0xFFE0712D),
                              ),

                              const SizedBox(width: 7),

                              CustomMinibutton(
                                text: 'No',
                                textcolor: const Color(0xffE0712D),
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                backgroundColor: const Color(0xffFFFAF7),
                              ),

                            ],
                          ),

                        ],
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 10),

              CustomNew(
                text: "Edit Profile Info",
                onTap: () {},
              ),

              const SizedBox(height: 10),

              CustomNew(text: "Privacy Policy"),

              const SizedBox(height: 10),

              CustomNew(text: "Terms and Conditions"),

              const SizedBox(height: 10),

              CustomNew(
                text: "Delete Account",

                onTap: () {

                  showDialog(
                    context: context,

                    builder: (context) {

                      return Dialog(

                        backgroundColor: const Color(0xffFFFAF7),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(24),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              const Text(
                                "Confirm Delete Account",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              const Text(
                                "Are you sure you want to delete your account?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: 10),

                              CustomEdit(
                                title: "Current Password",
                                hintText: "**************",
                              ),

                              const SizedBox(height: 15),

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
                                    onPressed: () {},

                                    child: const Text(
                                      "Delete",
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
              ),

              const SizedBox(height: 35),

              CustomButton(
                text: "Sign Out",

                onTap: () {

                  showDialog(
                    context: context,

                    builder: (context) {

                      return Dialog(

                        backgroundColor: const Color(0xffFFFAF7),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        insetPadding: const EdgeInsets.symmetric(
                          horizontal: 35,
                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(24),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              const Text(
                                "Confirm Sign Out",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 16),

                              const Text(
                                "Are you sure you want to sign out?",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                              ),

                              const SizedBox(height: 24),

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
                                    onPressed: () {},

                                    child: const Text(
                                      "Sign Out",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 16,
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
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}