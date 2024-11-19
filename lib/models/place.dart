class Place {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final String? category;

  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.category,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['place_id'] ?? '',
      name: json['name'] ?? json['address_line1'] ?? 'Unknown Place',
      address: json['formatted'] ?? 'No address available',
      latitude: json['lat'] ?? 0.0,
      longitude: json['lon'] ?? 0.0,
      category: json['category'],
    );
  }
}
