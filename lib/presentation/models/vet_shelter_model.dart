class VetShelterModel {
  final int id;
  final String name; // vet name
  final String rating;
  final String type; // vet or shelter
  final String address;
  final String? status;
  VetShelterModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.type,
    required this.address,
    this.status,
  });
}
