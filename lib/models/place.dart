class LocationData {
  String ip = '';
  String city;
  String region;
  String country;
  String flagUrl;

  LocationData({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.flagUrl,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      ip: json['ip'] ?? 'unknown',
      city: json['city'] ?? 'unknown',
      region: json['region_name'] ?? 'unknown',
      country: json['country'] ?? 'unknown',
      flagUrl: json['country_flag'] ?? 'unknown',
    );
  }
}
