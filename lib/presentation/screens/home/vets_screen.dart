import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/search_bar.dart';
import 'package:youppie/presentation/widgets/vet_card.dart';
import 'package:youppie/presentation/widgets/filter_button.dart';

class VetScreen extends StatefulWidget {
  const VetScreen({super.key});

  @override
  State<VetScreen> createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  int _currentIndex = 0;
  bool isListView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Vets & Shelters",
        
        backgroundColor: AppColors.yellow,
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilterButton(
                    hint: "Type",
                    options: const ['vet', 'shelter'],
                    backgroundColor: AppColors.white,
                    dropdownColor: AppColors.white,
                    textStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                  FilterButton(
                    hint: "City",
                    options: const ['Algeirs', 'Constantine', 'Oran', 'Annaba'],
                    backgroundColor: AppColors.white,
                    dropdownColor: AppColors.white,
                    textStyle: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isListView = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      color: isListView ? AppColors.green : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "List View",
                      style: TextStyle(
                        color: isListView ? Colors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isListView = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 25,
                    ),
                    decoration: BoxDecoration(
                      color: !isListView ? AppColors.green : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Map View",
                      style: TextStyle(
                        color: !isListView ? Colors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          CustomSearchBar(
            controller: TextEditingController(),
            hint: 'Search vets and shelters...',
            onChanged: (value) {},
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const [
                VetCard(
                  name: "Happy Paws Vet Clinic",
                  rating: "4.5",
                  type: "vet",
                  address: "123 Main Street, Algiers",
                  status: "Open",
                ),
                VetCard(
                  name: "Green Tail Shelter",
                  rating: "4.8",
                  type: "shelter",
                  address: "Bouzareah, Algiers",
                  status: "Closed",
                ),
                VetCard(
                  name: "Friendly Vet Hospital",
                  rating: "4.2",
                  type: "vet",
                  address: "SidiAbdAllah, Algiers",
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.yellow,

      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
