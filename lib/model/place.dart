import 'dart:convert';

class Place {
  final int id;
  final String name;
  final String description;
  final List<String> imageUrls;
  final String address;

  Place(this.id, this.name, this.description, this.imageUrls, this.address);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrls': imageUrls,
      'address': address,
    };
  }

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      map['id']?.toInt() ?? 0,
      map['name'] ?? '',
      map['description'] ?? '',
      List<String>.from(map['imageUrls']),
      map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Place.fromJson(String source) => Place.fromMap(json.decode(source));
}
