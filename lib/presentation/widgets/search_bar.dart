import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.hint = "Search...",
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 8.0,
        right: 20.0,
        bottom: 4.0,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.search, color: AppColors.black),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
