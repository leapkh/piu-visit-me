import 'package:visit_me/model/place.dart';

class HomeData {
  final List<String> slideImageUrls;
  final List<Place> nearMePlaces;
  final List<Place> topPlaces;

  HomeData(this.slideImageUrls, this.nearMePlaces, this.topPlaces);
}
