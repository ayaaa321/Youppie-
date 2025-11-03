import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color palette as you provided
class AppColors {
  AppColors._();

  static const Color green = Color(0xFF5B928C); // Primary Accent
  static const Color yellow = Color(0xFFFFF8E1); // Background
  static const Color black = Color(0xFF3B3B3A); // Text (neutral)
  static const Color white = Color(0xFFFFFFFF); // Main white
  static const Color grey = Color(0xFF535353);
  static const Color darkGreen = Color(0xFF314C49);
  static const Color metaText = Color(0xFFA0A0A0);
  static const Color accentRed = Color(0xFFE57373);
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Notification toggles
  bool likes = true;
  bool comments = true;
  bool newPosts = false;
  bool appUpdates = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SafeArea(
        child: Column(
          children: [
            // Header + search
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Account Info
                    Text(
                      'Account Info',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBlurCard(
                      children: [
                        _buildAccountTile(Icons.lock_reset, 'Change Password'),
                        _divider(),
                        _buildAccountTile(Icons.mail, 'Email'),
                        _divider(),
                        _buildAccountTile(Icons.phone, 'Phone Number'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Notifications
                    Text(
                      'Notifications',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBlurCard(
                      children: [
                        _buildSettingsSwitch('Likes', likes, (v) => setState(() => likes = v)),
                        _divider(),
                        _buildSettingsSwitch('Comments', comments, (v) => setState(() => comments = v)),
                        _divider(),
                        _buildSettingsSwitch('New Posts', newPosts, (v) => setState(() => newPosts = v)),
                        _divider(),
                        _buildSettingsSwitch('App Updates (Email)', appUpdates, (v) => setState(() => appUpdates = v)),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Legal & Support
                    Text(
                      'Legal & Support',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBlurCard(
                      children: [
                        _buildLegalTile('Terms of Service'),
                        _divider(),
                        _buildLegalTile('Privacy Policy'),
                        _divider(),
                        _buildLegalTile('Help & Support'),
                      ],
                    ),
                    const SizedBox(height: 32),
                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          textStyle: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          elevation: 4,
                          shadowColor: AppColors.green.withOpacity(0.15),
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Nav
            _buildBottomNavBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.yellow.withOpacity(0.95),
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.black),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white.withOpacity(0.8),
                    contentPadding: const EdgeInsets.symmetric(vertical: 13, horizontal: 48),
                    hintText: "Search...",
                    hintStyle: GoogleFonts.nunito(
                        color: AppColors.metaText, fontSize: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.25), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: const BorderSide(color: AppColors.green, width: 1.5),
                    ),
                  ),
                ),
                const Positioned(
                  left: 16,
                  child: Icon(Icons.search, color: AppColors.metaText, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(
    height: 1,
    color: Colors.grey.withOpacity(0.16),
    margin: const EdgeInsets.symmetric(vertical: 0),
  );

  // Container for the blur background cards
  Widget _buildBlurCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 7,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildAccountTile(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, color: AppColors.green, size: 24),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.nunito(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.metaText),
        ],
      ),
    );
  }

  Widget _buildSettingsSwitch(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.nunito(fontSize: 16, color: AppColors.black),
            ),
          ),
        Switch(
  value: value,
  onChanged: onChanged,
  activeColor: AppColors.green,
  inactiveThumbColor: AppColors.metaText,
  inactiveTrackColor: Colors.grey.withOpacity(0.35),
  trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
  //shape: const StadiumBorder(),
)
,

        ],
      ),
    );
  }

  Widget _buildLegalTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.nunito(fontSize: 16, color: AppColors.black),
            ),
          ),
          Icon(Icons.chevron_right, color: AppColors.metaText),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.9),
        border: Border(top: BorderSide(width: 1, color: Colors.grey.withOpacity(0.22))),
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
          _bottomNavItem(Icons.home, 'Home', false),
          _bottomNavItem(Icons.travel_explore, 'Lost & Found', false),
          _centerNavAction(),
          _bottomNavItem(Icons.storefront, 'Vets & Shelters', false),
          _bottomNavItem(Icons.person, 'Profile', true),
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

  Widget _bottomNavItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: active ? AppColors.green : AppColors.metaText, size: 26),
        Text(
          label,
          style: GoogleFonts.nunito(
              color: active ? AppColors.green : AppColors.metaText,
              fontSize: 12,
              fontWeight: active ? FontWeight.bold : FontWeight.normal),
        )
      ],
    );
  }
}
