import 'dart:convert';

import 'dart:io';

import 'models/sunrise_sunset_model.dart';
import 'models/weather_models.dart';

class WeatherRepository {
  final client = HttpClient();

  Future<WeatherObject> getDataAPI() async {
    final json = await _networkRequest(
      'https://api.weather.yandex.ru/v2/forecast?lat=45.0448&lon=38.976&extra=true',
      [
        'X-Yandex-API-Key',
        'a203b7b7-f1ad-4310-9ad7-758f9f800880',
      ],
    );

    return WeatherObject.fromJason(json);
  }

  Future<SunriseSunsetData> getSunseSunriseData([String? tommorow]) async {
    String url = 'https://api.sunrisesunset.io/json?lat=45.0448&lng=38.976&timezone=UTM';

    final result = tommorow != null ? await _networkRequest('$url&data=$tommorow') : await _networkRequest(url);

    return SunriseSunsetData.fromJson(result);
  }

  Future<Map<String, dynamic>> _networkRequest(String url, [List<String>? headers]) async {
    try {
      final uri = Uri.parse(url);
      final request = await client.getUrl(uri);

      if (headers != null) {
        request.headers.add(headers[0], headers[1]);
      }

      final response = await request.close();
      final jsonString = await response.transform(utf8.decoder).toList();
      final json = jsonDecode(jsonString.join()) as Map<String, dynamic>;

      return json;
    } catch (error) {
      throw 'detect error: $error';
    }
  }
}
