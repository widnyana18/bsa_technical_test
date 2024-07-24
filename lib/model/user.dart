import 'package:form_input/model/address.dart';
import 'package:form_input/model/company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] as int,
        name: json["name"] as String,
        username: json["username"] as String,
        email: json["email"] as String,
        address: Address.fromJson(json["address"] as Map<String, dynamic>),
        phone: json["phone"] as String,
        website: json["website"] as String,
        company: Company.fromJson(json["company"] as Map<String, dynamic>),
      );
}
