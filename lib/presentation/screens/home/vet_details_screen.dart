import 'package:flutter/material.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/models/vet_shelter_model.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';

class VetDetailsScreen extends StatefulWidget {
  const VetDetailsScreen({super.key, required this.vet});
  final VetShelterModel vet;
  @override
  State<VetDetailsScreen> createState() => _VetDetailsScreenState();
}

class _VetDetailsScreenState extends State<VetDetailsScreen> {
  int _currentIndex = 0;
  bool isServicesView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: CustomAppBar(
        title: widget.vet.name,
        isHome: false,
        showBack: true, // if this screen should have a back button
        showNotification: true, // optional
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (widget.vet.pictures.isNotEmpty) ...[
              const SizedBox(height: 10),

              if (widget.vet.pictures.length == 1)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      widget.vet.pictures[0],
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (widget.vet.pictures.length > 1)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.vet.pictures.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              widget.vet.pictures[index],
                              width: double.infinity,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],

            Container(
              width: double.infinity,
              child: Card(
                elevation: 0.5,
                color: AppColors.lightYellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.vet.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Row(
                            children: List.generate(5, (i) {
                              return Icon(
                                Icons.star,
                                color: i + 1 < widget.vet.rating
                                    ? AppColors.darkGreen
                                    : AppColors.lightGreen,
                              );
                            }),
                          ),

                          const SizedBox(width: 4),
                          Text(
                            " ${widget.vet.rating} (${widget.vet.reviewsCount ?? 0} reviews)",
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColors
                                  .lightGreen, // background color you want
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.location_on_outlined,
                              color: AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(widget.vet.address),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColors
                                  .lightGreen, // background color you want
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.phone_outlined,
                              color: AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(widget.vet.contact),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColors
                                  .lightGreen, // background color you want
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: AppColors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(widget.vet.workingHours),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.green,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: AppColors.white,
                                  size: 25,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Call",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.directions_outlined,
                                  color: AppColors.green,
                                  size: 25,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "Get Location",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // toogle bar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // --- Services Tab ---
                GestureDetector(
                  onTap: () => setState(() => isServicesView = true),
                  child: Column(
                    children: [
                      Text(
                        "Services",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isServicesView
                              ? AppColors.green
                              : Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // underline indicator
                      Container(
                        height: 2,
                        width: 100,
                        color: isServicesView
                            ? AppColors.green
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 40),

                // --- Reviews Tab ---
                GestureDetector(
                  onTap: () => setState(() => isServicesView = false),
                  child: Column(
                    children: [
                      Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: !isServicesView
                              ? AppColors.green
                              : Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 6),
                      // underline indicator
                      Container(
                        height: 2,
                        width: 100,
                        color: !isServicesView
                            ? AppColors.green
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 600,
              child: isServicesView
                  ? Center(
                      child: Text(
                        "Services View",
                        style: TextStyle(fontSize: 20, color: AppColors.grey),
                      ),
                    )
                  : Center(
                      child: Text(
                        "Reviews View",
                        style: TextStyle(fontSize: 20, color: AppColors.grey),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
