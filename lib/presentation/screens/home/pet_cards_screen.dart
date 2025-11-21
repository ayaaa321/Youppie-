// lib/presentation/screens/my_pets_screen.dart
import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/pet_card.dart';

class MyPetsScreen extends StatefulWidget {
  const MyPetsScreen({super.key});

  @override
  State<MyPetsScreen> createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
  int _currentIndex = 1; // My Pets tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "My Pets",
        backgroundColor: AppColors.yellow,
        showBack: true, // replaces the old leading: BackButton()
        showNotification: true, // optional
      ),
      body: Column(
        children: [
          // Pet Cards List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(top: 16, bottom: 80),
              children: const [
                MyPetCard(
                  name: 'Max',
                  breed: 'Golden Retriever',
                  imageUrl:
                      'https://www.davpetlovers.in/cdn/shop/files/golden-retriever-puppy_davpetlovers_1000x1000.jpg?v=1733299208',
                  leftIconLabel: 'Next Vet Visit',
                  leftIconValue: 'Dec 12, 2024',
                  leftIcon: Icons.calendar_today_outlined,
                  rightIconLabel: 'Last Activity',
                  rightIconValue: 'Walk in park',
                  rightIcon: Icons.favorite_outline,
                ),
                MyPetCard(
                  name: 'Whiskers',
                  breed: 'Domestic Shorthair',
                  imageUrl:
                      'https://images.unsplash.com/photo-1518791841217-8f162f1e1131',
                  leftIconLabel: 'Vaccination due',
                  leftIconValue: 'In 3 months',
                  leftIcon: Icons.medical_services_outlined,
                  rightIconLabel: 'Fun Fact',
                  rightIconValue: 'Loves boxes',
                  rightIcon: Icons.lightbulb_outline,
                ),
                MyPetCard(
                  name: 'Buddy',
                  breed: 'Corgi',
                  imageUrl:
                      'https://images.unsplash.com/photo-1560807707-8cc77767d783',
                  leftIconLabel: 'Next Vet Visit',
                  leftIconValue: 'Jan 20, 2025',
                  leftIcon: Icons.calendar_today_outlined,
                  rightIconLabel: 'Birthday',
                  rightIconValue: 'April 5th',
                  rightIcon: Icons.cake_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightYellow,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new pet logic
        },
        backgroundColor: AppColors.darkGreen,
        child: const Icon(Icons.add, color: AppColors.lightYellow, size: 32),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
