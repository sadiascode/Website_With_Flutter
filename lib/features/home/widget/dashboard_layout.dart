import 'package:flutter/material.dart';


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
    return Container(
      width: 220,
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
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  ...List.generate(_menuItems.length, (index) {
                    return _buildMenuItem(index);
                  }),

                  const SizedBox(height: 20),

                  _buildUpgradeCard(),
                ],
              ),
            ),

            const SizedBox(height: 20),

            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(int index) {
    final item = _menuItems[index];
    final bool isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => widget.onItemSelected(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? _orangePrimary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              item.icon,
              size: 20,
              color: isSelected ? Colors.white : _textGrey,
            ),
            const SizedBox(width: 12),
            Text(
              item.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : _textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpgradeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xffE0712D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upgrade your account to\nget free coupon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 9,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Upgrade',
                style: TextStyle(
                  color: _orangePrimary,
                  fontSize: 13,
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
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 28),
      child: Column(
        children: [
          SizedBox(height: 240),
          _buildBottomItem(
            icon: Icons.help_outline_rounded,
            label: 'Help',
            onTap: () {},
          ),
          const SizedBox(height: 4),
          _buildBottomItem(
            icon: Icons.delete,
            label: 'Delete Account',
            onTap: () {},
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isLogout ? Color(0xffE0712D) : _textGrey,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isLogout ? Color(0xffE0712D): _textDark,
              ),
            ),
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