// lib/presentation/screens/vet_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:youppie/presentation/widgets/app_bar.dart';
import 'package:youppie/presentation/widgets/nav_bar.dart';
import 'package:youppie/presentation/themes/colors.dart';
import 'package:youppie/presentation/widgets/search_bar.dart';
import 'package:youppie/presentation/widgets/vet_card.dart';
import 'package:youppie/presentation/widgets/filter_button.dart';
import 'package:youppie/presentation/models/vet_shelter_model.dart';

// Vet/Shelter data model
class VetLocation {
  final String name;
  final String rating;
  final String type;
  final String address;
  final String status;
  final LatLng position;

  VetLocation({
    required this.name,
    required this.rating,
    required this.type,
    required this.address,
    required this.status,
    required this.position,
  });
}

class VetScreen extends StatefulWidget {
  const VetScreen({super.key});

  @override
  State<VetScreen> createState() => _VetScreenState();
}

class _VetScreenState extends State<VetScreen> {
  int _currentIndex = 0;
  bool isListView = true;
  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();

  // Algiers coordinates as center
  static const LatLng _algiers = LatLng(36.7538, 3.0588);

  // Sample vet and shelter locations with full details
  final List<VetLocation> _vetLocations = [
    VetLocation(
      name: "Happy Paws Vet Clinic",
      rating: "4.5",
      type: "vet",
      address: "123 Main Street, Algiers",
      status: "Open",
      position: const LatLng(36.7538, 3.0588),
    ),
    VetLocation(
      name: "Green Tail Shelter",
      rating: "4.8",
      type: "shelter",
      address: "Bouzareah, Algiers",
      status: "Closed",
      position: const LatLng(36.7838, 3.0388),
    ),
    VetLocation(
      name: "Friendly Vet Hospital",
      rating: "4.2",
      type: "vet",
      address: "SidiAbdAllah, Algiers",
      status: "Open",
      position: const LatLng(36.7238, 3.0788),
    ),
  ];

  // Store markers to reference them later
  late final List<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _markers = _buildMarkers();
  }

  List<Marker> _buildMarkers() {
    return _vetLocations.asMap().entries.map((entry) {
      final index = entry.key;
      final vet = entry.value;

      return Marker(
        key: ValueKey(index), // Add key to identify marker
        point: vet.position,
        width: 40,
        height: 40,
        child: GestureDetector(
          onTap: () {
            // Find and toggle the marker by its key
            final marker = _markers.firstWhere((m) => m.key == ValueKey(index));
            _popupController.togglePopup(marker);
          },
          child: Icon(
            Icons.location_on,
            color: vet.type == 'vet' ? Colors.green : Colors.orange,
            size: 40,
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Vets & Shelters",
        backgroundColor: AppColors.yellow,
        showBack: true, // if this screen should have a back button
        showNotification: true, // optional
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

          // View Toggle
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
                        fontWeight: FontWeight.w600,
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
                        fontWeight: FontWeight.w600,
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

          // Content Area - List or Map
          Expanded(child: isListView ? _buildListView() : _buildMapView()),
        ],
      ),
      backgroundColor: AppColors.yellow,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _buildListView() {
    VetShelterModel vet1 = VetShelterModel(
      id: 1,
      name: "Happy Paws Vet Clinic",
      rating: "4.5",
      type: "vet",
      address: "123 Main Street, Algiers",
      status: "Open",
    );

    VetShelterModel vet2 = VetShelterModel(
      id: 2,
      name: "Green Tail Shelter",
      rating: "4.8",
      type: "shelter",
      address: "Bouzareah, Algiers",
      status: "Closed",
    );

    VetShelterModel vet3 = VetShelterModel(
      id: 1,
      name: "Friendly Vet Hospital",
      rating: "4.2",
      type: "vet",
      address: "SidiAbdAllah, Algiers",
    );

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        VetCard(center: vet1),
        VetCard(center: vet2),
        VetCard(center: vet3),
      ],
    );
  }

  Widget _buildMapView() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _algiers,
                initialZoom: 12.0,
                minZoom: 5.0,
                maxZoom: 18.0,
                onTap: (_, __) => _popupController.hideAllPopups(),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.youppie',
                  maxZoom: 19,
                ),
                MarkerLayer(markers: _markers),
                PopupMarkerLayer(
                  options: PopupMarkerLayerOptions(
                    popupController: _popupController,
                    markers: _markers,
                    popupDisplayOptions: PopupDisplayOptions(
                      builder: (BuildContext context, Marker marker) {
                        // Get the index from the marker's key
                        final key = marker.key as ValueKey<int>;
                        final index = key.value;
                        final vet = _vetLocations[index];
                        return _buildPopupContent(vet);
                      },
                    ),
                  ),
                ),
              ],
            ),

            // Legend
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.green.shade600,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        const Text('Vet', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.orange.shade600,
                          size: 18,
                        ),
                        const SizedBox(width: 6),
                        const Text('Shelter', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Zoom Controls
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: 'zoom_in',
                    onPressed: () {
                      final currentZoom = _mapController.camera.zoom;
                      _mapController.move(
                        _mapController.camera.center,
                        currentZoom + 1,
                      );
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.add, color: AppColors.green),
                  ),
                  const SizedBox(height: 8),
                  FloatingActionButton.small(
                    heroTag: 'zoom_out',
                    onPressed: () {
                      final currentZoom = _mapController.camera.zoom;
                      _mapController.move(
                        _mapController.camera.center,
                        currentZoom - 1,
                      );
                    },
                    backgroundColor: Colors.white,
                    child: const Icon(Icons.remove, color: AppColors.green),
                  ),
                ],
              ),
            ),

            // My Location Button
            Positioned(
              bottom: 16,
              left: 16,
              child: FloatingActionButton.small(
                heroTag: 'my_location',
                onPressed: () {
                  _mapController.move(_algiers, 14.0);
                },
                backgroundColor: Colors.white,
                child: const Icon(Icons.my_location, color: AppColors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupContent(VetLocation vet) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Name and Type Badge
          Row(
            children: [
              Expanded(
                child: Text(
                  vet.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: vet.type == 'vet'
                      ? Colors.green.shade100
                      : Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  vet.type.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: vet.type == 'vet'
                        ? Colors.green.shade700
                        : Colors.orange.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Rating
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                vet.rating,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Address
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 16,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  vet.address,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Status
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: vet.status == 'Open' ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                vet.status,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: vet.status == 'Open' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Get Directions Button
          // Get Directions Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Opening directions to ${vet.name}...'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              }, //to implement later the actual directions functionalities
              icon: const Icon(Icons.directions, size: 16),
              label: const Text('Get Directions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
