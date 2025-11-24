import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/screens/review/review.dart';

class VetReviewsPage extends StatelessWidget {
  const VetReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Dr. Feline's Vet Clinic",
          style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),

      // Floating Review Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReviewPage(),
            ), // use your actual Write Review page widget class name
          );
        },

        backgroundColor: AppColors.green,
        label: const Text(
          "Write a Review",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.edit, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Vets tab active
        onTap: (index) {},
      ),

      body: ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _filterChip("Most Recent", true),
                const SizedBox(width: 8),
                _filterChip("Highest Rating", false),
                const SizedBox(width: 8),
                _filterChip("Lowest Rating", false),
              ],
            ),
          ),

          // Reviews List
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                _reviewCard(
                  userName: "Amina K.",
                  date: "Nov 23, 2023",
                  rating: 5,
                  avatarUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuCzWENrfQSpBlkuQakAb04Dd3bn9oX3jlSH7UkpLZL1ji8bcgbNJdjrA30g0yBBo27941g8sS7FDHpfUeKVcQtLI9TQNLnDLw4D2-brY-LQixuhksj85kK7hcJnaLlox0o3XhbGUNqW5pPsorwLawvxc-2zrgbEq3d69wep4eOX1Q9a-DqAq55zehNmVDkKHyw-PEQUMYnskuWkmsq8pDrsHedrLk5Yzpf8rIHVkoWxXeMIC_gIWP1CaPCHvVpCt7wV3r5XalQlwTo",
                  reviewText:
                      "Dr. Feline and the team are absolutely wonderful. They were so gentle "
                      "and caring with my cat, Whiskers. The clinic is clean, and they "
                      "clearly explain everything. Highly recommend!",
                ),
                const SizedBox(height: 12),
                _reviewCard(
                  userName: "Karim B.",
                  date: "Oct 15, 2023",
                  rating: 4,
                  avatarUrl:
                      "https://lh3.googleusercontent.com/aida-public/AB6AXuCZ0JTuPlVrl7q4iY49GJcdlcU04ocAZNk3-2OibbLpS1zGL5UKt9ElhViWOxYRN46rXO9QkTFhELnsnU7cIf0XtV0V_Y6YW5W4y6OPoIy7KbLrllL-h9LGx-S7dgwYabkGAUE4Lc5VG43rQnVo7Z75McKIwdvYlcoaX2Rh-esmM7D_mwKtlJ-IMK_HYeUGcw1P5UaFUGpuv04uUWx58tNXd-DiZ3MOKCZzHSLbOHuucoiTxkxm5ZFq43wcK4u2tIRnl84sMf_qnJI",
                  reviewText:
                      "A great experience overall. The staff was professional and the "
                      "facilities were top-notch. My dog was a bit nervous but they handled "
                      "him with care. The only reason for 4 stars is the wait time was a little long.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget: Filter Chip
  Widget _filterChip(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: selected ? AppColors.green : AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected ? AppColors.green : Colors.grey.shade300,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Widget: Review Card
  Widget _reviewCard({
    required String userName,
    required String date,
    required int rating,
    required String avatarUrl,
    required String reviewText,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGrey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (avatar + name)
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Star rating
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                Icons.star,
                size: 20,
                color: index < rating ? AppColors.green : Colors.grey.shade300,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Review text
          Text(
            reviewText,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
