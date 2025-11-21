import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/models/vet_shelter_model.dart ';

VetShelterModel vet = VetShelterModel(
  id: 1,
  name: "Happy Paws Vet Clinic",
  rating: "4.5",
  type: "vet",
  address: "123 Main Street, Algiers",
  status: "Open",
);

class VetDetailsScreen extends StatefulWidget {
  final VetShelterModel vet;

  const VetDetailsScreen({super.key, required this.vet});

  @override
  State<VetDetailsScreen> createState() => _VetDetailsScreenState();
}

class _VetDetailsScreenState extends State<VetDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.vet.name,
        backgroundColor: AppColors.yellow,
        showBack: true, // if this screen should have a back button
        showNotification: true, // optional
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("hello there"),
          ),
        ],
      ),
    );
  }
}
