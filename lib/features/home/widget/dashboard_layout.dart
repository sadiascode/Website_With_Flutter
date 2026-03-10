import 'package:flutter/material.dart';

import '../../help&support/screen/help_screen.dart';



class FoodServiceSidebar extends StatefulWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  const FoodServiceSidebar({
    super.key,
    required this.onItemSelected,
    required this.selectedIndex,
  });

  @override
  State<FoodServiceSidebar> createState() => _FoodServiceSidebarState();
}

class _FoodServiceSidebarState extends State<FoodServiceSidebar> {
  static const Color _orangePrimary = Color(0xffE0712D);
  static const Color _orangeLight = Color(0xFFFFF0EA);
  static const Color _textDark = Color(0xFF1A1A1A);
  static const Color _textGrey = Color(0xFF8A8A8A);
  static const Color _bgWhite = Color(0xFFFFFFFF);

  final List<_SidebarItem> _menuItems = [
    _SidebarItem(icon: Icons.grid_view_rounded, label: 'Overview'),
    _SidebarItem(icon: Icons.fastfood_rounded, label: 'Food Order'),
    _SidebarItem(icon: Icons.favorite_border_rounded, label: 'Favourite'),
    _SidebarItem(icon: Icons.chat_bubble_outline_rounded, label: 'Messages'),
    _SidebarItem(icon: Icons.history_rounded, label: 'Order History'),
    _SidebarItem(icon: Icons.person, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    // Responsive width calculation
    double getSidebarWidth() {
      if (isMobile) return 70;
      if (isTablet) return 160;
      return 220;
    }
    
    // Responsive spacing calculation
    double getResponsiveSpacing(double baseSpacing) {
      if (isMobile) return baseSpacing * 0.6;
      if (isTablet) return baseSpacing * 0.8;
      return baseSpacing;
    }
    
    // Responsive font size calculation
    double getResponsiveFontSize(double baseFontSize) {
      if (isMobile) return baseFontSize * 0.8;
      if (isTablet) return baseFontSize * 0.9;
      return baseFontSize;
    }
    
    // Responsive icon size calculation
    double getResponsiveIconSize(double baseIconSize) {
      if (isMobile) return baseIconSize * 0.8;
      if (isTablet) return baseIconSize * 0.9;
      return baseIconSize;
    }

    return Container(
      width: getSidebarWidth(),
      height: double.infinity,
      decoration: BoxDecoration(
        color: _bgWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 30,
            spreadRadius: 5,
            offset: const Offset(0, -8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 35,
            spreadRadius: 6,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 30,
            spreadRadius: 5,
            offset: const Offset(8, 0),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            spreadRadius: 3,
            offset: const Offset(-4, 0),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getResponsiveSpacing(12)),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: getResponsiveSpacing(12)),
              child: Column(
                children: [
                  ...List.generate(_menuItems.length, (index) {
                    return _buildMenuItem(index);
                  }),

                  SizedBox(height: getResponsiveSpacing(20)),

                  _buildUpgradeCard(),
                ],
              ),
            ),

            SizedBox(height: getResponsiveSpacing(20)),

            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index) {
    final item = _menuItems[index];
    final bool isSelected = widget.selectedIndex == index;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    // Responsive helper functions
    double getResponsiveSpacing(double baseSpacing) {
      if (isMobile) return baseSpacing * 0.6;
      if (isTablet) return baseSpacing * 0.8;
      return baseSpacing;
    }
    
    double getResponsiveFontSize(double baseFontSize) {
      if (isMobile) return baseFontSize * 0.8;
      if (isTablet) return baseFontSize * 0.9;
      return baseFontSize;
    }
    
    double getResponsiveIconSize(double baseIconSize) {
      if (isMobile) return baseIconSize * 0.8;
      if (isTablet) return baseIconSize * 0.9;
      return baseIconSize;
    }

    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
      child: Container(
        margin: EdgeInsets.only(bottom: getResponsiveSpacing(4)),
        padding: EdgeInsets.symmetric(
          horizontal: getResponsiveSpacing(14), 
          vertical: getResponsiveSpacing(12)
        ),
        decoration: BoxDecoration(
          color: isSelected ? _orangePrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: getResponsiveIconSize(20),
              color: isSelected ? Colors.white : _textGrey,
            ),
            SizedBox(width: getResponsiveSpacing(12)),
            // Hide text on very small screens
            if (!isMobile) ...[
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(14),
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected ? Colors.white : _textDark,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUpgradeCard() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    // Responsive helper functions
    double getResponsiveSpacing(double baseSpacing) {
      if (isMobile) return baseSpacing * 0.6;
      if (isTablet) return baseSpacing * 0.8;
      return baseSpacing;
    }
    
    double getResponsiveFontSize(double baseFontSize) {
      if (isMobile) return baseFontSize * 0.8;
      if (isTablet) return baseFontSize * 0.9;
      return baseFontSize;
    }
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(getResponsiveSpacing(16)),
      decoration: BoxDecoration(
        color: Color(0xffE0712D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isMobile ? 'Upgrade\nto get coupon' : 'Upgrade your account to\nget free coupon',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(12),
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          SizedBox(height: getResponsiveSpacing(14)),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: getResponsiveSpacing(20),
                vertical: getResponsiveSpacing(9),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Upgrade',
                style: TextStyle(
                  color: _orangePrimary,
                  fontSize: getResponsiveFontSize(13),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildBottomSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    // Responsive helper functions
    double getResponsiveSpacing(double baseSpacing) {
      if (isMobile) return baseSpacing * 0.6;
      if (isTablet) return baseSpacing * 0.8;
      return baseSpacing;
    }
    
    double getResponsiveFontSize(double baseFontSize) {
      if (isMobile) return baseFontSize * 0.8;
      if (isTablet) return baseFontSize * 0.9;
      return baseFontSize;
    }
    
    double getResponsiveIconSize(double baseIconSize) {
      if (isMobile) return baseIconSize * 0.8;
      if (isTablet) return baseIconSize * 0.9;
      return baseIconSize;
    }
    
    return Container(
      padding: EdgeInsets.fromLTRB(
        getResponsiveSpacing(12), 
        getResponsiveSpacing(12), 
        getResponsiveSpacing(12), 
        getResponsiveSpacing(28)
      ),
      child: Column(
        children: [
          SizedBox(height: getResponsiveSpacing(240)),
          _buildBottomItem(
            icon: Icons.help_outline_rounded,
            label: 'Help',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HelpScreen(),
                ),
              );
            },
          ),
          SizedBox(height: getResponsiveSpacing(4)),
          _buildBottomItem(
            icon: Icons.delete,
            label: isMobile ? 'Delete' : 'Delete Account',
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
                              Icons.delete,
                              color: Color(0xffE0712D),
                              size: 30,
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            "Confirm Delete Account",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            "Are you sure you want to delete your account?",
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),),
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
                                  child: const Text("Delete",
                                    style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              );
            },
            isLogout: true,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;
    
    // Responsive helper functions
    double getResponsiveSpacing(double baseSpacing) {
      if (isMobile) return baseSpacing * 0.6;
      if (isTablet) return baseSpacing * 0.8;
      return baseSpacing;
    }
    
    double getResponsiveFontSize(double baseFontSize) {
      if (isMobile) return baseFontSize * 0.8;
      if (isTablet) return baseFontSize * 0.9;
      return baseFontSize;
    }
    
    double getResponsiveIconSize(double baseIconSize) {
      if (isMobile) return baseIconSize * 0.8;
      if (isTablet) return baseIconSize * 0.9;
      return baseIconSize;
    }
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getResponsiveSpacing(14), 
          vertical: getResponsiveSpacing(12)
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: getResponsiveIconSize(20),
              color: isLogout ? Color(0xffE0712D) : _textGrey,
            ),
            SizedBox(width: getResponsiveSpacing(12)),
            // Hide text on very small screens
            if (!isMobile) ...[
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(14),
                    fontWeight: FontWeight.w500,
                    color: isLogout ? Color(0xffE0712D): _textDark,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _SidebarItem {
  final IconData icon;
  final String label;

  const _SidebarItem({required this.icon, required this.label});
}