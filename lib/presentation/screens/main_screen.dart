import 'package:flutter/material.dart';
import 'package:youppie/presentation/screens/home/lost_found_screen.dart';
import 'package:youppie/presentation/screens/profile/profile_screen.dart';
import 'package:youppie/presentation/screens/home/vets_screen.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/screens/home/banner.dart';
import 'package:youppie/presentation/screens/posts/add_post_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    GuestFeedScreen(), // Index 0
    LostFoundScreen(), // Index 1
    AddPostScreen(), // Index 2
    VetScreen(), // Index 3
    ProfileScreen(), // Index 4
  ];

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
