class Station {
  const Station({
    required this.code,
    required this.name,
    required this.city,
    required this.timeZone,
  });

  final String code;
  final String name;
  final String city;
  final String timeZone;

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      code: json['code'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      timeZone: json['timeZone'] as String,
    );
  }
}