class VetShelterModel {
  final int id;
  final String name; // vet name
  final double rating;
  final String type; // vet or shelter
  final String address;
  final String? status;
  final List<String> pictures;
  final String contact;
  final String workingHours;
  final int? reviewsCount;
  VetShelterModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.type,
    required this.address,
    required this.contact,
    this.workingHours = '',
    this.pictures = const [],
    this.status,
    this.reviewsCount,
  });
}
