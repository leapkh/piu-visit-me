import 'package:visit_me/model/home_data.dart';
import 'package:visit_me/model/place.dart';

class DataProvider {
  static Future<HomeData> loadHomeData() async {
    await Future.delayed(const Duration(seconds: 2));
    return HomeData([
      'https://visit-me.s3.ap-southeast-1.amazonaws.com/img_royal_palace.jpg',
      'https://visit-me.s3.ap-southeast-1.amazonaws.com/img_national_museum.jpg'
    ], [
      Place(
          1,
          'Royal Palace',
          'This is royal palace.',
          [
            'https://visit-me.s3.ap-southeast-1.amazonaws.com/img_royal_palace.jpg'
          ],
          'Phnom Penh')
    ], [
      Place(
          1,
          'Royal Palace',
          'This is royal palace.',
          [
            'https://visit-me.s3.ap-southeast-1.amazonaws.com/img_royal_palace.jpg'
          ],
          'Phnom Penh')
    ]);
  }
}
