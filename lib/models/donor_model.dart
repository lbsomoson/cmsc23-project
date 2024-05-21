import 'dart:convert';

class Donor {
  String? id;
  String name;
  String email;

  Donor({this.id, required this.name, required this.email});

  // Factory constructor to instantiate object from json format
  factory Donor.fromJson(Map<String, dynamic> json) {
    return Donor(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  static List<Donor> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Donor>((dynamic d) => Donor.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Donor donor) {
    return {
      'name': donor.name,
      'email': donor.email,
    };
  }
}