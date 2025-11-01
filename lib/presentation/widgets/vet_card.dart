import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class VetCard extends StatelessWidget {
  final String name; // vet name
  final String rating;
  final String type; // vet or shelter
  final String address;
  final String? status; // open or closed

  const VetCard({
    super.key,
    required this.name,
    required this.rating,
    required this.type,
    required this.address,
    this.status,
  });
  static var cardTypeColor = {
    'shelter': AppColors.green,
    'vet': AppColors.darkGreen,
  };
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightYellow,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  type,
                  style: TextStyle(
                    color: cardTypeColor[type.toLowerCase()] ?? AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star_outline, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  address,
                  style: const TextStyle(fontSize: 14, color: AppColors.grey),
                ),
                if (status != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    status!,
                    style: TextStyle(
                      color: status!.toLowerCase() == 'open'
                          ? Colors.green
                          : Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen, // background color you want
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.phone_outlined,
                      color: AppColors.green,
                    ),
                    onPressed: () {
                      // Implement map functionality
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightGreen, // background color you want
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.directions_outlined,
                      color: AppColors.green,
                    ),
                    onPressed: () {
                      // Implement map functionality
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
