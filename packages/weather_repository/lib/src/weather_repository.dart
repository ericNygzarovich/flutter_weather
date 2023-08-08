import 'dart:convert';

import 'dart:io';

import 'models/weather_models.dart';

class WeatherRepository {
  final client = HttpClient();

  Future<WeatherObject> getDataAPI() async {
    try {
      final url = Uri.parse(
          'https://api.weather.yandex.ru/v2/forecast?lat=45.0448&lon=38.976&extra=true');
      final request = await client.getUrl(url);
      request.headers
          .add('X-Yandex-API-Key', 'a203b7b7-f1ad-4310-9ad7-758f9f800880');

      final response = await request.close();
      final jsonString = await response.transform(utf8.decoder).toList();
      final json = jsonDecode(jsonString.join()) as Map<String, dynamic>;

      return WeatherObject.fromJason(json);
    } catch (error) {
      throw 'detect error: $error';
    }
  }
}
