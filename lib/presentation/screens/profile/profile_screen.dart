import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // private constructor

  static const Color green = Color(0xFF5B928C); // Primary Accent
  static const Color yellow = Color(0xFFFFF8E1); // Background
  static const Color black = Color(0xFF3B3B3A); // Text (neutral)
  static const Color white = Color(0xFFFFFFFF); // Main white
  static const Color grey = Color(0xFF535353);
  static const Color darkGreen = Color(0xFF314C49);
  static const Color metaText = Color(0xFFA0A0A0);
  static const Color accentRed = Color(0xFFE57373);
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Font family is set in main/theme as Nunito if used through pubspec
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 16,
                right: 16,
                bottom: 4,
              ),
              child: Stack(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 48), // symmetrical with actions
                  Expanded(
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Profile Avatar
                        Container(
                          width: 128,
                          height: 128,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/girl.png',
                              ), // your local image
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Name
                        Text(
                          'Chahd Hammami',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Location
                        Text(
                          'Algiers',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.metaText,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Bio
                        Text(
                          'Proud owner of a fluffy cat named Whiskers. Always happy to help fellow pet lovers.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Edit Profile Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              foregroundColor: AppColors.white,
                              minimumSize: const Size(84, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(999),
                              ),
                              elevation: 2,
                              shadowColor: AppColors.green.withOpacity(0.3),
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            label: const Text(
                              'Edit Profile',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: AppColors.black.withOpacity(0.1),
                  ),
                  // Menu Items
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    child: Column(
                      children: [
                        _ProfileMenuItem(
                          icon: Icons.grid_view,
                          iconBg: AppColors.green.withOpacity(0.1),
                          iconColor: AppColors.green,
                          title: 'My Posts',
                          onTap: () {},
                          trailing: Icons.chevron_right,
                        ),
                        const SizedBox(height: 12),
                        _ProfileMenuItem(
                          icon: Icons.settings,
                          iconBg: AppColors.green.withOpacity(0.1),
                          iconColor: AppColors.green,
                          title: 'Settings',
                          onTap: () {},
                          trailing: Icons.chevron_right,
                        ),
                        const SizedBox(height: 12),
                        _ProfileMenuItem(
                          icon: Icons.workspace_premium,
                          iconBg: Colors.yellow.withOpacity(0.2),
                          iconColor: Colors.orange.shade800,
                          title: 'Premium badge',
                          onTap: () {},
                          trailing: Icons.chevron_right,
                        ),
                        const SizedBox(height: 24),
                        _ProfileMenuItem(
                          icon: Icons.logout,
                          iconBg: AppColors.accentRed.withOpacity(0.1),
                          iconColor: AppColors.accentRed,
                          title: 'Log out',
                          titleColor: AppColors.accentRed,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        color: AppColors.yellow.withOpacity(0.8),
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavBarItem(icon: Icons.home, label: 'Home', onTap: () {}),
              _NavBarItem(
                icon: Icons.search,
                label: 'Lost & Found',
                onTap: () {},
              ),
              _NavCenterButton(),
              _NavBarItem(icon: Icons.pets, label: 'Vets', onTap: () {}),
              _NavBarItem(
                icon: Icons.person,
                label: 'Profile',
                selected: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profile menu list item widget
class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final IconData? trailing;
  final VoidCallback onTap;
  final Color? titleColor;
  const _ProfileMenuItem({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.trailing,
    this.titleColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: titleColor ?? AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (trailing != null)
              Icon(trailing, color: AppColors.metaText, size: 24),
          ],
        ),
      ),
    );
  }
}

// Navigation Bar button widget
class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _NavBarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.green : AppColors.metaText;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 7),
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 1),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Center FAB style button for navigation bar
class _NavCenterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: AppColors.green.withOpacity(0.3),
                  blurRadius: 12,
                ),
              ],
            ),
            child: const Icon(Icons.add, color: AppColors.white, size: 40),
          ),
        ),
      ),
    );
  }
}
