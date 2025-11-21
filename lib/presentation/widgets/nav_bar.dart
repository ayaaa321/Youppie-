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
        color: AppColors.white.withOpacity(0.9),
        border: Border(
          top: BorderSide(width: 1, color: Colors.grey.withOpacity(0.22)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
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
          _centerNavAction(),
          _bottomNavItem(Icons.storefront, 'Vets & Shelters', 2),
          _bottomNavItem(Icons.person, 'Profile', 3),
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

  Widget _centerNavAction() {
    return Container(
      width: 48,
      height: 48,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.green,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.green.withOpacity(0.22),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Icon(Icons.add, color: Colors.white, size: 32),
    );
  }
}
