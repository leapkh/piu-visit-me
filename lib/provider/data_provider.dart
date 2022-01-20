import 'package:visit_me/model/home_data.dart';
import 'package:visit_me/model/place.dart';
import 'package:http/http.dart' as api;
import 'dart:convert';

class DataProvider {
  static Future<HomeData?> loadHomeData() async {
    
    try{
      // Make a GET request to the server
      final serverUrl = Uri.parse('http://localhost/test/home-data.json');
      final response = await api.get(serverUrl);
      if(response.statusCode != 200){
        throw Exception('Unexpected error.');
      }

      final responseBody = response.body;
      Map<String, dynamic> mapObject = jsonDecode(responseBody);

      return HomeData.fromMap(mapObject);
    } catch(ex){
      print('Error while converting from map object to HomeData object.');
      print(ex.toString());
      return null;
    }
    
  }
}
