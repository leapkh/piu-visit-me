import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visit_me/model/home_data.dart';
import 'package:visit_me/model/place.dart';
import 'package:http/http.dart' as api;
import 'dart:convert';

import 'package:visit_me/model/review.dart';

class DataProvider {
  static Future<HomeData?> loadHomeData() async {
    // Loading data from Firestore
    final slidesCol =
        await FirebaseFirestore.instance.collection('slides').get();
    final slides = slidesCol.docs
        .map((slideDoc) => slideDoc.data()['imageUrl'].toString())
        .toList();
    final nearMePlacesCol =
        await FirebaseFirestore.instance.collection('places').get();
    final nearMePlaces = nearMePlacesCol.docs
        .map((placeDoc) => Place.fromMap(placeDoc.data()))
        .toList();
    return HomeData(slides, nearMePlaces, nearMePlaces);

    // Loading data from Web API
    /*try {
      // Make a GET request to the server
      //final serverUrl = Uri.parse('http://localhost/test/home-data.json');
      final serverUrl = Uri.parse('http://localhost:3000/home');

      final response = await api.get(serverUrl);

      if (response.statusCode != 200) {
        throw Exception('Unexpected error.');
      }

      final responseBody = response.body;
      return HomeData.fromJson(responseBody);
    } catch (ex) {
      print(ex.toString());
      return null;
    }*/
  }

  static Future<Review?> addReview(
    int id,
    String reviewer,
    String reviewerProfile,
    String comment,
  ) async {
    Map<String, dynamic> requestBody = {
      'reviewer': reviewer,
      'reviewerProfile': reviewerProfile,
      'comment': comment,
      'time': '1443453534'
    };
    final serverUrl = Uri.parse('http://localhost:3000/reviews');

    final response = await api.post(serverUrl, body: requestBody);
    if (response.statusCode == 201) {
      return Review.fromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<Review>> loadReviews(int placeId) async {
    final serverUrl = Uri.parse('http://localhost:3000/reviews');
    final response = await api.get(serverUrl);
    if (response.statusCode == 200) {
      // Deserialize json string to list of reviews
      final mapObject = jsonDecode(response.body);
      return (mapObject as List).map((e) => Review.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }
}
