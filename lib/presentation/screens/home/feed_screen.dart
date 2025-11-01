import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/post_card.dart';
import 'package:youppie/presentation/widgets/search_bar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Feed",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        backgroundColor: AppColors.yellow,
        textColor: AppColors.black,
      ),
      body: Column(
        children: [
          CustomSearchBar(
            controller: TextEditingController(),
            hint: 'Search posts...',
            onChanged: (value) {},
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                PostCard(
                  username: 'Dhoha',
                  userProfilePic: 'assets/images/picture.jpeg',
                  timeAgo: '2 hours ago',
                  postType: 'Adoption',
                  content:
                      'This is a cat I found near my house. Looking for a loving home!',
                  imagePath: 'assets/images/cat.jpeg',
                  likes: 24,
                  comments: 10,
                ),
                PostCard(
                  username: 'Aya',
                  userProfilePic: 'assets/images/picture1.jpeg',
                  timeAgo: '5 hours ago',
                  postType: 'General',
                  content:
                      'Remember to always keep your pets hydrated during hot weather! Remember to always keep your pets hydrated during hot weather!Remember to always keep your pets hydrated during hot weather!Remember to always keep your pets hydrated during hot weather!Remember to always keep your pets hydrated during hot weather!Remember to always keep your pets hydrated during hot weather!',
                  likes: 12,
                  comments: 3,
                ),
                PostCard(
                  username: 'Salma',
                  userProfilePic: 'assets/images/picture2.jpeg',
                  timeAgo: '1 day ago',
                  postType: 'Adoption',
                  content:
                      'Roborovski hamsters available for adoption. Very cute and playful!',
                  imagePath: 'assets/images/hamsters.jpeg',
                  likes: 30,
                  comments: 15,
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: AppColors.yellow,

      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
