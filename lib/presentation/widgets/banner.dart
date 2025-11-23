import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/custom_submit_button.dart';

class Banner extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final List<String>? texts;
  final List<String>? imagesURLs;
  final CustomSubmitButton? actionButton;
  final String? statistics;
  

  const Banner({
    this.backgroundColor,
    this.textColor,
    this.texts,
    this.imagesURLs,
    this.actionButton,
    this.statistics,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bannerHeight = MediaQuery.of(context).size.height * 0.25;
    final bannerWidth = MediaQuery.of(context).size.width;

    return Container(
      width: bannerWidth,
      height: bannerHeight,
      color: backgroundColor ?? AppColors.lightGreen,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // The Cutie Picture
          Positioned(
            right: -75,
            bottom: -20,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/welcome_image_stacked.png",
                  width: bannerWidth * 0.9,
                  height: bannerHeight * 1.4,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

          // Text content
          Positioned(
            left: 20,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < (texts?.length ?? 0); i++)
                  Text(
                    texts![i],
                    style:
                        (i == 0
                                ? Theme.of(context).textTheme.headlineMedium
                                : Theme.of(context).textTheme.headlineSmall)
                            ?.copyWith(
                              color: textColor ?? const Color(0xFF3B3B3A),
                            ),
                  ),
                if (statistics != null) ...[
                  const SizedBox(height: 8),
                  Text(statistics!),
                ],
              ],
            ),
          ),

          // Button
          if (actionButton != null)
            Positioned(
              left: 40,
              bottom: 25,
              child: SizedBox(
                height: bannerHeight * 0.25, // adjust to taste
                width: bannerWidth * 0.4, // Give it some width
                child: actionButton,
              ),
            ),
        ],
      ),
    );
  }
}
        // Centered card with shadow
        //Center(
        //  child: SingleChildScrollView(
        //    child: Stack(
        //      clipBehavior: Clip.none,
        //      children: [
        //        // Main card container
        //        Container(
        //          width: bannerWidth * 0.85,
        //          padding: const EdgeInsets.symmetric(vertical: 16),
        //          decoration: BoxDecoration(
        //            color: Colors.white,
        //            borderRadius: BorderRadius.circular(20),
        //            boxShadow: [
        //              BoxShadow(
        //                color: Colors.black.withValues(alpha:  0.15),
        //                blurRadius: 10,
        //                offset: const Offset(0, 6),
        //              ),
        //            ],
        //          ),
        //          child: Column(
        //            children: [
        //              // Image with stamp overlay
        //              Stack(
        //                children: [
        //                  ClipRRect(
        //                    borderRadius: BorderRadius.circular(20),
        //                    child: Padding(
        //                      padding: const EdgeInsets.symmetric(horizontal: 8),
        //                      child: imageUrl != null
        //                          ? Image.network(
        //                              imageUrl!,
        //                              width: double.infinity,
        //                              height: screenHeight * 0.45,
        //                              fit: BoxFit.cover,
        //                            )
        //                          : Container(
        //                              width: double.infinity,
        //                              height: screenHeight * 0.45,
        //                              color: Colors.grey.shade200,
        //                              alignment: Alignment.center,
        //                              child: const Icon(Icons.image_outlined, size: 64),
        //                            ),
        //                    ),
        //                  ),
        //                  // Stamp overlay on image
        //                  Center(
        //                    
//
        //                    child: Transform.rotate(
        //                      angle: 0.15, // Slight tilt for stamp effect
        //                      child: Container(
        //                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        //                        decoration: BoxDecoration(
        //                          color: Colors.white.withValues(alpha: 0.0),
        //                          border: Border.all(
        //                            color: isLost ? Colors.red : Colors.green,
        //                            width: 4,
        //                          ),
        //                          borderRadius: BorderRadius.circular(8),
        //                          boxShadow: [
        //                            BoxShadow(
        //                              color: Colors.black.withValues(alpha:  0.2),
        //                              blurRadius: 8,
        //                              offset: const Offset(0, 2),
        //                            ),
        //                          ],
        //                        ),
        //                        child: Text(
        //                          isLost ? 'LOST' : 'FOUND',
        //                          style: TextStyle(
        //                            color: isLost ? Colors.red : Colors.green,
        //                            fontWeight: FontWeight.w900,
        //                            fontSize: 28,
        //                            letterSpacing: 4,
        //                          ),
        //                        ),
        //                      ),
        //                    ),
        //                  ),
        //                ],
        //              ),
        //              const SizedBox(height: 16),
//
        //              // Name
        //              Text(
        //                name,
        //                style: const TextStyle(
        //                    fontSize: 28,
        //                    fontWeight: FontWeight.bold,
        //                    color: Colors.black),
        //              ),
        //              const SizedBox(height: 8),
//
        //              // Breed
        //              Text(
        //                breed,
        //                style: const TextStyle(fontSize: 20, color: Colors.black54),
        //              ),
        //              const SizedBox(height: 8),
//
        //              // Location & date
        //              Row(
        //                mainAxisAlignment: MainAxisAlignment.center,
        //                children: [
        //                  const Icon(Icons.location_on_outlined, color: Colors.black54),
        //                  const SizedBox(width: 4),
        //                  Text(location,
        //                      style:
        //                          const TextStyle(fontSize: 16, color: Colors.black54)),
        //                  const SizedBox(width: 16),
        //                  const Icon(Icons.calendar_today_outlined, color: Colors.black54),
        //                  const SizedBox(width: 4),
        //                  Text(DateFormat.yMMMd().format(date),
        //                      style: const TextStyle(fontSize: 16, color: Colors.black54)),
        //                ],
        //              ),
        //              const SizedBox(height: 16),
//
        //              // Contact Owner Button
        //              Padding(
        //                padding: const EdgeInsets.symmetric(horizontal: 24),
        //                child: ElevatedButton(
        //                  onPressed: () {
        //                    _showContactOptions(context);
        //                  },
        //                  style: ElevatedButton.styleFrom(
        //                    backgroundColor: const Color(0xFF4A6B6B),
        //                    foregroundColor: Colors.white,
        //                    padding: const EdgeInsets.symmetric(vertical: 14),
        //                    shape: RoundedRectangleBorder(
        //                      borderRadius: BorderRadius.circular(30),
        //                    ),
        //                    minimumSize: const Size(double.infinity, 50),
        //                  ),
        //                  child: const Text(
        //                    'Contact',
        //                    style: TextStyle(
        //                      fontSize: 18,
        //                      fontWeight: FontWeight.w600,
        //                    ),
        //                  ),
        //                ),
        //              ),
        //              const SizedBox(height: 16),
        //            ],
        //          ),
        //        ),
//
        //        // Top pin
        //        Positioned(
        //          top: -10,
        //          left: (screenWidth * 0.85) / 2 - 9,
        //          child: Container(
        //            width: 18,
        //            height: 18,
        //            decoration: BoxDecoration(
        //              color: Colors.white,
        //              shape: BoxShape.circle,
        //              border: Border.all(
        //                color: isLost ? Colors.red : Colors.green,
        //                width: 3,
        //              ),
        //              boxShadow: [
        //                BoxShadow(
        //                  color: Colors.black.withValues(alpha:  0.2),
        //                  blurRadius: 4,
        //                  offset: const Offset(0, 2),
        //                ),
        //              ],
        //            ),
        //          ),
        //        ),
        //      ],
        //    ),
        //  ),
        //),
