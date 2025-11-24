import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youppie/presentation/themes/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.9),
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey.withValues(alpha: 0.22)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomNavItem(Icons.home, 'Home', 0),
          _bottomNavItem(Icons.travel_explore, 'Lost & Found', 1),
          _bottomNavItem(
            Icons.add_circle,
            'Add Post',
            2,
          ), // FIXED: comma and better icon
          _bottomNavItem(
            Icons.pets_outlined,
            'Vets & Shelters',
            3,
          ), // FIXED: index
          _bottomNavItem(Icons.person, 'Profile', 4), // FIXED: index
        ],
      ),
    );
  }

  Widget _bottomNavItem(IconData icon, String label, int index) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? AppColors.green : AppColors.grey,
            size: 26,
          ),
          Text(
            label,
            style: GoogleFonts.nunito(
              color: isActive ? AppColors.green : AppColors.grey,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
