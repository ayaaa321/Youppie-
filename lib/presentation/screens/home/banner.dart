import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/themes/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:youppie/presentation/screens/auth/signup_screen.dart';

import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/widgets/post_card.dart';
import 'package:youppie/presentation/widgets/search_bar.dart';
import 'package:youppie/presentation/widgets/banner.dart' as BannerWidget;
import 'package:youppie/presentation/widgets/custom_submit_button.dart';

class GuestFeedScreen extends StatefulWidget {
  const GuestFeedScreen({super.key});

  @override
  State<GuestFeedScreen> createState() => _GuestFeedScreenState();
}

class _GuestFeedScreenState extends State<GuestFeedScreen> {
  int _currentIndex = 0;
  bool showBanner = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Feed",
        backgroundColor: AppColors.green,
        isHome: true, // if this is the main page
        showBack: false,
        showNotification: true,
      ),
      body: Column(
        children: [
          Visibility(
            visible: showBanner,
            child: Stack(
              children: [
                BannerWidget.Banner(
                  backgroundColor: AppColors.yellow,
                  textColor: Color(0xFF3B3B3A),
                  texts: [
                    "Welcome to Youppie!",
                    "Share. Connect. Enjoy.",
                    "and much more!",
                  ],
                  imagesURLs: [],
                  actionButton: CustomSubmitButton(
                    text: "Join us Now!",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountPage(),
                        ),
                      );
                    },
                  ),
                ),

                // Close Button
                Positioned(
              right: 12,
              top: 12,
              child: GestureDetector(
                onTap: _hideBanner,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
          CustomSearchBar(
            controller: TextEditingController(),
            hint: 'Search posts...',
            onChanged: (value) {},
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                PostCard(
                  username: 'Dhoha',
                  userProfilePic: 'assets/images/picture.jpeg',
                  timeAgo: '2 hours ago',
                  postType: 'Adoption',
                  content:
                      'This is a cat I found near my house. Looking for a loving home!',
                  imagePath: [
                    'assets/images/cat.jpeg',
                    'assets/images/golden_retriever_lost_page.jpeg',
                  ],
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
                  imagePath: ['assets/images/hamsters.jpeg'],
                  likes: 30,
                  comments: 15,
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: AppColors.yellow,

      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  void _hideBanner() {
    showBanner = false;
    setState(() {});
  }
}
