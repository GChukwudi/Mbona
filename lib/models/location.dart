class LocationData {
  final double latitude;
  final double longitude;
  final String address;
  final String city;
  final String country;

  LocationData({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.city,
    required this.country,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
      address: json['address'] ?? '',
      city: json['city'] ?? 'unknown',
      country: json['country'] ?? 'unknown',
    );
  }
}
