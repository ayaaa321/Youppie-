
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:youppie/presentation/themes/colors.dart';

class LostFoundDetailCard extends StatelessWidget {
  final String status;
  final String name;
  final String breed;
  final String location;
  final DateTime date;
  final String? imageUrl;

  const LostFoundDetailCard({
    super.key,
    required this.status,
    required this.name,
    required this.breed,
    required this.location,
    required this.date,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Background
        Container(
          color: AppColors.yellow,
          width: double.infinity,
          height: screenHeight,
        ),

        // Centered card with shadow
        Center(
          child: SingleChildScrollView(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Main card container
                Container(
                  width: screenWidth * 0.85,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Image with side padding
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: imageUrl != null
                              ? Image.network(
                                  imageUrl!,
                                  width: double.infinity,
                                  height: screenHeight * 0.45,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: double.infinity,
                                  height: screenHeight * 0.45,
                                  color: Colors.grey.shade200,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.image_outlined, size: 64),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Name
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 8),

                      // Breed
                      Text(
                        breed,
                        style: const TextStyle(fontSize: 20, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),

                      // Location & date
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.location_on_outlined, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(location,
                              style:
                                  const TextStyle(fontSize: 16, color: Colors.black54)),
                          const SizedBox(width: 16),
                          const Icon(Icons.calendar_today_outlined, color: Colors.black54),
                          const SizedBox(width: 4),
                          Text(DateFormat.yMMMd().format(date),
                              style: const TextStyle(fontSize: 16, color: Colors.black54)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Status button (bigger)
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                        decoration: BoxDecoration(
                          color: status.toUpperCase() == 'LOST'
                              ? Colors.pinkAccent.shade100
                              : Colors.green.shade300,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          status.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),

                // Top pin
                Positioned(
                  top: -10,
                  left: (screenWidth * 0.85) / 2 - 9, // center pin horizontally
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: status.toUpperCase() == 'LOST'
                            ? Colors.pinkAccent.shade100
                            : Colors.green.shade300,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
