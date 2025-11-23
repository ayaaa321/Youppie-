import 'package:flutter/material.dart';
import 'package:youppie/presentation/themes/colors.dart';

class PetTypeSelector extends StatelessWidget {
  final String selectedType;
  final List<String> petTypes;
  final Function(String) onSelect;

  const PetTypeSelector({
    super.key,
    required this.selectedType,
    required this.petTypes,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedType,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      items: petTypes
          .map((type) => DropdownMenuItem(value: type, child: Text(type)))
          .toList(),
      onChanged: (value) => onSelect(value!),
    );
  }
}
