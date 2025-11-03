import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/lost_found_card.dart';
import 'package:youppie/presentation/widgets/search_bar.dart';
import 'package:youppie/presentation/widgets/filter_button.dart';

class LostFoundScreen extends StatefulWidget {
  const LostFoundScreen({super.key});

  @override
  State<LostFoundScreen> createState() => _LostFoundScreenState();
}

class _LostFoundScreenState extends State<LostFoundScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Lost & Found",
        fontWeight: FontWeight.bold,
        fontSize: 24,
        backgroundColor: AppColors.yellow,
        textColor: AppColors.black,
      ),
      body: Column(
        
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0.4, left: 0.4, right: 0.4, top: 10),
            child: CustomSearchBar(
              controller: TextEditingController(),
              hint: 'Search for your pet!',
              onChanged: (value) {},
            ),
          ),

          
              Padding(
                padding: const EdgeInsets.only(bottom: 0.4, left: 0.4, right: 0.4, top: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    
                      children: [
                        
                         FilterButton(
                          hint: "Type",
                          options: ['Lost', 'Found'],
                        
                        ),
                        FilterButton(
                          hint: "Location",
                          options: ['Algiers', 'Annaba','Oran'],
                        
                        ),
                        FilterButton(
                          hint: "Date",
                          options: ['2025', '2024','2023'],
                        
                        ),
                      ],
                    
                  
                  ),
                ),
              ),
            
            
         

         
          Expanded(
            child: 
              Padding(padding: const EdgeInsets.only(top: 20),
              child : 
                GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                childAspectRatio: 0.60, // slightly taller to highlight images
                children: const [
                  PetCard(
                    status: 'LOST',
                    name: 'Fido',
                    location: 'Algiers',
                    imageUrl:
                        'https://www.davpetlovers.in/cdn/shop/files/golden-retriever-puppy_davpetlovers_1000x1000.jpg?v=1733299208',
                  ),
                  PetCard(
                    status: 'FOUND',
                    name: 'Whiskers',
                    location: 'Oran',
                    imageUrl:
                        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131',
                  ),
                  PetCard(
                    status: 'LOST',
                    name: 'Buddy',
                    location: 'Constantine',
                    imageUrl:
                        'assets/images/golden_retriever_lost_page.jpeg',
                  ),
                  PetCard(
                    status: 'FOUND',
                    name: 'Luna',
                    location: 'Tipaza',
                    imageUrl:
                        'https://images.unsplash.com/photo-1560807707-8cc77767d783',
                  ),
                ],
              ),
              ),
          ),
        ],
      ),
      backgroundColor: AppColors.yellow,
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
  