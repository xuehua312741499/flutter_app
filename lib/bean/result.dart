import 'package:flutter_app/bean/contact.dart';
import 'package:flutter_app/bean/he_weather.dart';
import 'package:flutter_app/bean/image.dart';

class Result {
  String title;
  int count;
  int start;
  int total;

  /// 天气
  List<HeWeather> heWeather;

  /// 联系人
  List<Contact> contacts;

  List<ImageModal> images;

  static Result fromMap(Map<String, dynamic> map) {
    Result result = Result();
    result.title = map['title'] == null ? "" : map['title'];
    result.count = map['count'];
    result.start = map['start'];
    result.total = map['total'];
    result.contacts = List()
      ..addAll((map['results'] as List ?? []).map((o) => Contact.fromMap(o)));

    result.heWeather = List()
      ..addAll(
          (map['HeWeather6'] as List ?? []).map((o) => HeWeather.fromMap(o)));

    result.images =
        map['list'] == null ? [] : ImageModal.fromMapList(map['list']);
    return result;
  }
}
