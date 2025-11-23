import 'package:flutter/material.dart';

import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int selectedRating = 3;
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,  // Page background

      appBar: AppBar(
        backgroundColor: AppColors.yellow,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
        ),
        title: const Text(
          "Review PetCare Clinic",
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // CLINIC INFO
              const Text(
                "PetCare Clinic",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                "123 Vet Street, Algiers, Algeria",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightGrey,
                ),
              ),

              const SizedBox(height: 24),

              // OVERALL RATING TITLE
              const Text(
                "Your overall rating",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 12),

              // STAR RATING ICONS
              Row(
                children: List.generate(5, (index) {
                  final filled = index < selectedRating;
                  return IconButton(
                    onPressed: () {
                      setState(() => selectedRating = index + 1);
                    },
                    icon: Icon(
                      Icons.star,
                      size: 32,
                      color: filled ? AppColors.green : AppColors.lightGrey,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 24),

              // REVIEW FIELD TITLE
              const Text(
                "Your Review",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),

              // REVIEW TEXT FIELD
              TextField(
                controller: reviewController,
                minLines: 5,
                maxLines: null,
                decoration: InputDecoration(
                  hintText:
                      "Tell us about your visit, what you liked, and what could be improved.",
                  hintStyle: const TextStyle(color: AppColors.lightGrey),
                  filled: true,
                  fillColor: AppColors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.green.withOpacity(0.6),
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),

      // SUBMIT BUTTON
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.yellow,
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              debugPrint("Rating: $selectedRating");
              debugPrint("Review: ${reviewController.text}");
            },
            child: const Text(
              "Submit Review",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),

      // NAV BAR FROM YOUR WIDGET

    
      bottomNavigationBar: BottomNavBar(
  currentIndex: 0,
  onTap: (index) {
    // TODO: navigate or change pages
    print("Tapped bottom nav item $index");
  },
),

    );
  }
}
