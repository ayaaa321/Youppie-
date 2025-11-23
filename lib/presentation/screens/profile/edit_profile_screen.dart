import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedCity = "Algiers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4, // profile selected
        onTap: (index) {},
      ),
      body: Column(
        children: [
          // ------------------- APP BAR -------------------
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 8),
            color: AppColors.yellow,
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(Icons.arrow_back, color: AppColors.black),
                    ),
                    const Expanded(
                      child: Text(
                        "Edit Profile",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24), // placeholder to balance layout
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: AppColors.lightGrey),
                    hintText: "Search...",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.lightGrey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                )
              ],
            ),
          ),

          // ------------------- PROFILE BODY -------------------
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // PROFILE IMAGE
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuD66ZQo8OmkYHTQObCAPG0MuChlKM-XjN2sOA6s06fPCJzfpQUz7yoNg0_5MdKZGqXlXTrPOyt3hGn_VkLM5U2THi4eQP_U6Kcw50s1HMFMWPeJ_GZElScaceE64fs4Gxg9Uuf7i7-yCLN12aUh7YpWVippL53iuGQOD5-kumLAOOxTF9Z1X9gq9fjJYPtH5qannml4RKWSJZq_xwx-85Wn4FeBqigQ8NGNdtx2KIFTCZ9bv8DeVtSNJENUyhK07doiDaH8Kx_Pe24",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.edit, color: Colors.white, size: 18),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ------------------- NAME -------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Name",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.lightGrey),
                          ),
                        ),
                        controller: TextEditingController(text: "John Doe"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ------------------- BIO -------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bio",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        maxLines: 6,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Tell us more...",
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppColors.lightGrey),
                          ),
                        ),
                        controller: TextEditingController(
                          text:
                              "I love all animals, especially dogs. Looking to connect with other pet lovers in Algiers.",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // ------------------- CITY -------------------
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "City / Location",
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.lightGrey),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedCity,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(value: "Algiers", child: Text("Algiers")),
                            DropdownMenuItem(value: "Oran", child: Text("Oran")),
                            DropdownMenuItem(value: "Constantine", child: Text("Constantine")),
                            DropdownMenuItem(value: "Annaba", child: Text("Annaba")),
                            DropdownMenuItem(value: "Blida", child: Text("Blida")),
                          ],
                          onChanged: (value) {
                            setState(() => selectedCity = value!);
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ------------------- SAVE BUTTON -------------------
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Save Changes",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
