import 'dart:io';
import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/pet_type_selector.dart';
import 'package:youppie/presentation/widgets/upload_photos_field.dart';
import 'package:youppie/presentation/widgets/custom_submit_button.dart';

class EditPostScreen extends StatefulWidget {
  final Map<String, dynamic> postData; 
  // Example: {
  //   "title": "My Post",
  //   "description": "Hello",
  //   "phone": "+213 123 456",
  //   "location": "Algiers",
  //   "category": 1,
  //   "petType": "Cat",
  //   "images": [File("/path/to/image1"), File("/path/to/image2")]
  // }

  const EditPostScreen({super.key, required this.postData});

  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  late int selectedCategory;
  final categories = ["General", "Adoption"];
  late String selectedPet;

  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController phoneController;
  late TextEditingController locationController;

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.postData['category'] ?? 0;
    selectedPet = widget.postData['petType'] ?? "Cat";

    titleController = TextEditingController(text: widget.postData['title'] ?? '');
    descriptionController = TextEditingController(text: widget.postData['description'] ?? '');
    phoneController = TextEditingController(text: widget.postData['phone'] ?? '');
    locationController = TextEditingController(text: widget.postData['location'] ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        title: const Text("Edit Post"),
        elevation: 0,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category Tabs
            Row(
              children: List.generate(categories.length, (index) {
                final isSelected = index == selectedCategory;
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? AppColors.green : AppColors.green.withOpacity(0.4),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: isSelected ? AppColors.green : AppColors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Pet Type Selector
            const Text(
              "Pet Type",
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            PetTypeSelector(
              selectedType: selectedPet,
              petTypes: ["Cat","Dog","Bird","Rabbit","Hamster","Other"],
              onSelect: (value) => setState(() => selectedPet = value),
            ),
            const SizedBox(height: 20),

            // Title Field
            const Text("Title", style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(controller: titleController, decoration: _inputDecoration(hint: "Enter post title...")),
            const SizedBox(height: 20),

            // Description Field
            const Text("Description", style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(controller: descriptionController, maxLines: 5, decoration: _inputDecoration(hint: "Write something...")),
            const SizedBox(height: 20),

            // Upload Photos
            const Text("Upload Photos", style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            UploadPhotosField(existingImages: widget.postData['images']),
            const SizedBox(height: 20),

            // Phone Number
            const Text("Phone Number", style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: _inputDecoration(hint: "e.g. +213 123 456 789", icon: Icons.phone)),
            const SizedBox(height: 20),

            // Location
            const Text("Location", style: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            TextField(controller: locationController, decoration: _inputDecoration(hint: "e.g. Algiers", icon: Icons.location_on)),
            const SizedBox(height: 30),

            // Submit Button
            CustomSubmitButton(
              text: "Update Post",
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Frontend only ✅"))),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, IconData? icon}) {
    return InputDecoration(
      prefixIcon: icon != null ? Icon(icon, color: AppColors.grey) : null,
      hintText: hint,
      hintStyle: const TextStyle(color: AppColors.grey, fontSize: 14),
      filled: true,
      fillColor: AppColors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.green.withOpacity(0.4), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.green, width: 1.5),
      ),
    );
  }
}
