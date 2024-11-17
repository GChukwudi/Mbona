class Place {
  final String id;
  final String name;
  final String address;
  final String kinds;
  final String? description;

  Place({
    required this.id,
    required this.name,
    required this.address,
    required this.kinds,
    this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['xid'],
      name: json['name'],
      address: json['street'] ?? '',
      kinds: json['kinds'] ?? '',
      description: json['wikipedia'] ?? '',
    );
  }
}
