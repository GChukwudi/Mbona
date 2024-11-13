class LocationData {
  double latitude;
  double longitude;
  String street;
  String city;
  String country;
  String neighborhood;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.country,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      longitude: json['longitude'] ?? 0.0,
      latitude: json['latitude'] ?? 0.0,
      street: json['street'] ?? '',
      neighborhood: json['neighborhood'] ?? 'unknown',
      city: json['city'] ?? 'unknown',
      country: json['country'] ?? 'unknown',
    );
  }
}
