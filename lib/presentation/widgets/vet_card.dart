import 'package:flutter/material.dart';
import 'package:youppie/presentation/models/vet_shelter_model.dart';
import 'package:youppie/presentation/themes/colors.dart';

class VetCard extends StatelessWidget {
  final VetShelterModel center;

  const VetCard({super.key, required this.center});
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
                  center.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  center.type,
                  style: TextStyle(
                    color:
                        cardTypeColor[center.type.toLowerCase()] ??
                        AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star_outline, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      center.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  center.address,
                  style: const TextStyle(fontSize: 14, color: AppColors.grey),
                ),
                if (center.status != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    center.status!,
                    style: TextStyle(
                      color: center.status!.toLowerCase() == 'open'
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
                      // Implement phone call functionality
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
