class Address {
  final String street;
  final String suite;
  final String city;
  final String zipCode;
  final String geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipCode,
    required this.geo,
  });
// `toJson` converts a Address object to a JSON representation.
// `fromJson` creates a Address object from a JSON map.

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipCode: json["zipcode"],
        geo: json["geo"],
      );
}

class Geo {
  final String lat;
  final String lng;

  Geo({
    required this.lat,
    required this.lng,
  });
// `toJson` converts a Geo object to a JSON representation.
// `fromJson` creates a Geo object from a JSON map.

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );
}
