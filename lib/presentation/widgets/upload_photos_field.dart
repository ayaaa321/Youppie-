import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youppie/presentation/themes/colors.dart';

class UploadPhotosField extends StatefulWidget {
  const UploadPhotosField({super.key});

  @override
  State<UploadPhotosField> createState() => _UploadPhotosFieldState();
}

class _UploadPhotosFieldState extends State<UploadPhotosField> {
  final List<XFile> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();

    if (selectedImages.isNotEmpty) {
      setState(() {
        _images.addAll(selectedImages);
      });
    }
  }

  void removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        

        GestureDetector(
          onTap: pickImages,
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.green, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: AppColors.yellow,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.cloud_upload_outlined, size: 35, color: AppColors.darkGreen),
                SizedBox(height: 6),
                Text(
                  "Click to upload or drag and drop",
                  style: TextStyle(color: AppColors.darkGreen),
                ),
                SizedBox(height: 4),
                Text(
                  "PNG, JPG, GIF (MAX: 5MB)",
                  style: TextStyle(fontSize: 12, color: AppColors.grey),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ✅ Image Preview List
        if (_images.isNotEmpty)
          SizedBox(
            height: 95,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _images.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(_images[index].path),
                        width: 80,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // ❌ Remove Icon
                    Positioned(
                      right: -5,
                      top: -5,
                      child: GestureDetector(
                        onTap: () => removeImage(index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
