import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../constants.dart/constants.dart';
import '../exceptions/weather_exceptions.dart';
import '../models/direct_geocoding.dart';
import '../models/weather.dart';
import 'http_error_handler.dart';

class WeatherApiServices {
  final http.Client httpClient;

  WeatherApiServices({required this.httpClient});

  Future<DirectGeocoding> getDirectGeoCoding(String city) async {
    final uri = Uri(
      scheme: 'https',
      host: kApiHost,
      path: 'geo/1.0/direct',
      queryParameters: {'q': city, 'limit': kLimit, 'appid': dotenv.env['APPID']},
    );
    try {
      final http.Response response = await httpClient.get(uri);

      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final resposeBody = json.decode(response.body);

      if (resposeBody.isEmpty) {
        throw WeatherExceptions('Cannot get the location of $city ');
      }

      final directGeoCoding = DirectGeocoding.fromJson(resposeBody);
      return directGeoCoding;
    } catch (e) {
      rethrow;
    }
  }

  Future<Weather> getWeather(DirectGeocoding directGeocoding) async {
    final Uri uri = Uri(scheme: 'https', host: kApiHost, path: '/data/2.5/weather', queryParameters: {
      'lat': '${directGeocoding.lat}',
      'lon': '${directGeocoding.lon}',
      'units': kUnit,
      'appid': dotenv.env['APPID']
    });

    try {
      final http.Response response = await httpClient.get(uri);
      if (response.statusCode != 200) {
        throw httpErrorHandler(response);
      }

      final resposeBody = json.decode(response.body);
      if (response.body.isEmpty) {
        throw WeatherExceptions('Cannot get the weather of ${directGeocoding.name}');
      }
      return Weather.fromJson(resposeBody);
    } catch (e) {
      rethrow;
    }
  }
}
