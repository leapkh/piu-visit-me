import 'dart:convert';

import 'package:visit_me/model/place.dart';

class HomeData {
  final List<String> slideImageUrls;
  final List<Place> nearMePlaces;
  final List<Place> topPlaces;

  HomeData(this.slideImageUrls, this.nearMePlaces, this.topPlaces);

  Map<String, dynamic> toMap() {
    return {
      'slideImageUrls': slideImageUrls,
      'nearMePlaces': nearMePlaces.map((x) => x.toMap()).toList(),
      'topPlaces': topPlaces.map((x) => x.toMap()).toList(),
    };
  }

  factory HomeData.fromMap(Map<String, dynamic> map) {
    return HomeData(
      List<String>.from(map['slideImageUrls']),
      List<Place>.from(map['nearMePlaces']?.map((x) => Place.fromMap(x))),
      List<Place>.from(map['topPlaces']?.map((x) => Place.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeData.fromJson(String source) =>
      HomeData.fromMap(json.decode(source));
}
