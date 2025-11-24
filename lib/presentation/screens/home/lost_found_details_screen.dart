import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/lost_found_details.dart';

class LostFoundDetailsScreen extends StatefulWidget {
  const LostFoundDetailsScreen({super.key});

  @override
  State<LostFoundDetailsScreen> createState() => _LostFoundDetailsScreenState();
}

class _LostFoundDetailsScreenState extends State<LostFoundDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Lost & Found",
        backgroundColor: AppColors.yellow,
        isHome: false,
        showBack: true, // if you want a back button
        showNotification: true, // or false if not needed
      ),
      backgroundColor: AppColors.yellow,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LostFoundDetailCard(
            status: 'LOST',
            name: 'Fido',
            breed: "Siamese",
            location: 'Algiers',
            date: DateTime.now(),
            imageUrl:
                'https://www.davpetlovers.in/cdn/shop/files/golden-retriever-puppy_davpetlovers_1000x1000.jpg?v=1733299208',
          ),
        ),
      ),
    );
  }
}
