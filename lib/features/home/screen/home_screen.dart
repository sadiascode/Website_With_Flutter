import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodservice/features/home/widget/custom_banner.dart';
import 'package:foodservice/features/home/widget/dashboard_layout.dart';
import '../../message/screen/chat_screen.dart';
import '../../profile/screen/profile_screen.dart';
import '../../foodorder/screen/food_order_screen.dart';
import '../../favourite/screen/favourite_screen.dart';
import '../../orderhistory/screen/order_history_screen.dart';
import '../widget/custom_mini_button.dart';
import '../widget/custom_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<int> itemCounts = List.generate(7, (index) => 0);
  List<bool> isFavourite = List.generate(7, (index) => false);
  
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
                                color: const Color(0xffE0712D).withOpacity(
                                    0.1),
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
                                        borderRadius: BorderRadius.circular(12),),
                                      padding: const EdgeInsets.symmetric(vertical: 14),),
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
                                      backgroundColor: const Color(
                                          0xffE0712D),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            12),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 14),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      print("User Logged Out");
                                    },
                                    child: const Text("Logout",
                                      style: TextStyle(color: Colors.white),),
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
            Expanded(
              flex: 3,
              child: FoodServiceSidebar(
                onItemSelected: _onSidebarItemSelected,
                selectedIndex: _selectedIndex,
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBanner(),
                    const SizedBox(height: 30),
                    _buildPage(),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildFeaturedSection();
      case 1:
        return _buildFoodOrderPage();
      case 2:
        return _buildFavouritePage();
      case 3:
        return _buildMessagesPage();
      case 4:
        return _buildOrderHistoryPage();
      case 5:
        return _buildProfilePage();
      default:
        return _buildFeaturedSection();
    }
  }

  Widget _buildFoodOrderPage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Food Order',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Manage your food orders here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavouritePage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Favourite Items',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your favourite food items will appear here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesPage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Messages',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your messages and notifications will appear here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistoryPage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order History',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your previous orders will appear here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _onSidebarItemSelected(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FoodOrderScreen(),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavouriteScreen(),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OrderHistoryScreen(),
          ),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileScreen(),
          ),
        );
        break;
      default:
        setState(() {
          _selectedIndex = index;
        });
        break;
    }
  }

  Widget _buildProfilePage() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your profile information will appear here',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Intergalactic Restaurant',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1A1A),
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 1.2,
          ),
          itemCount: 7,
          itemBuilder: (context, index) {
            final List<String> foodNames = [
              'Cheese Burger',
              'Veggie Pizza',
              'Sushi Roll',
              'Pasta Alfredo',
              'Grilled Chicken',
              'Caesar Salad',
              'Caesar Salad',
            ];

            final List<String> descriptions = [
              'Juicy beef patty with cheese and fresh vegetables',
              'Fresh vegetables with mozzarella cheese',
              'Fresh salmon and avocado roll',
              'Creamy pasta with parmesan cheese',
              'Tender grilled chicken with herbs',
              'Crisp romaine lettuce with caesar dressing',
              'Crisp romaine lettuce with caesar dressing',

            ];

            final List<double> prices = [
              89.99,
              75.50,
              120.00,
              65.75,
              95.25,
              45.00,
              45.00,

            ];

            final List<String> imagePaths = [
              'assets/pnh.jpg',
              'assets/pizza.png',
              'assets/sushi.jpg',
              'assets/pasta.jpg',
              'assets/grilled.webp',
              'assets/caesar.jpg',
              'assets/caesar.jpg',
            ];

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12)),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  foodNames[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "\$${prices[index]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffE0712D),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Text(
                            descriptions[index],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 18),

                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffE0712D)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (itemCounts[index] > 0) {
                                            itemCounts[index]--;
                                          }
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        child: Icon(Icons.remove, size: 16, color: Color(0xffE0712D),),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      child: Text(
                                        itemCounts[index].toString(),
                                      ),
                                    ),

                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          itemCounts[index]++;
                                        });
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        child: Icon(Icons.add, size: 16, color: Color(0xffE0712D),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFavourite[index] = !isFavourite[index];
                                  });
                                },
                                icon: Icon(
                                  isFavourite[index] ? Icons.favorite : Icons.favorite_border,
                                  color: const Color(0xffE0712D),
                                  size: 20,
                                ),
                              ),

                              const Spacer(),

                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  const Color(0xffE0712D),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8),
                                ),
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}