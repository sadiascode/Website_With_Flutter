import 'package:flutter/material.dart';

class CustomFoodcard extends StatelessWidget {
  final String foodName;
  final String description;
  final double price;
  final String imagePath;
  final int index;

  const CustomFoodcard({
    super.key,
    required this.foodName,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: isSelected
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15)),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath,
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
                  Text(
                    foodName,
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context, 12),
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      fontSize: _getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffE0712D),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _getResponsiveFontSize(BuildContext context, double baseSize) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1200) return baseSize;
    if (screenWidth > 800) return baseSize * 0.9;
    return baseSize * 0.8;
  }
}