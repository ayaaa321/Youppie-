// lib/presentation/widgets/pet_preview_card.dart
import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class PetPreviewCard extends StatelessWidget {
  final String name;
  final String type;
  final String? imageUrl;

  const PetPreviewCard({
    super.key,
    required this.name,
    required this.type,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Pet Image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: imageUrl != null
                ? ClipOval(
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.pets, color: Colors.grey),
                    ),
                  )
                : const Icon(
                    Icons.pets,
                    color: Colors.grey,
                    size: 28,
                  ),
          ),
          const SizedBox(width: 12),
          // Pet Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.isEmpty ? 'Pet Name' : name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                type.isEmpty ? 'Type' : type,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}