import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },
                children: const [
                  OnboardingPage(
                    image: "assets/images/onboarding/pet1.png",
                    title: "Welcome to Youppie!",
                    description:
                        "Find the perfect companion or help a lost friend get back home 🐾",
                  ),
                  OnboardingPage(
                    image: "assets/images/onboarding/pet2.png",
                    title: "Adopt & Share",
                    description:
                        "Create posts to adopt pets or help others discover yours 💚",
                  ),
                  OnboardingPage(
                    image: "assets/images/onboarding/pet3.png",
                    title: "Help Pets Find Home",
                    description:
                        "Be part of a loving community that cares for animals 💛",
                  ),
                ],
              ),
            ),

            PageIndicator(currentPage: currentPage),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ✅ Back button — hidden on first screen
                  currentPage > 0
                      ? TextButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOut,
                            );
                          },
                          child: const Text("Back",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.darkGreen)),
                        )
                      : const SizedBox(width: 60),

                  // ✅ Next / Get Started button
                  ElevatedButton(
                    onPressed: () {
                      if (currentPage == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Signup screen coming soon 🚧"),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      currentPage == 2 ? "Get Started" : "Next",
                      style: const TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
