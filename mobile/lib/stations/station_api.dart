import 'dart:convert';

import 'package:http/http.dart' as http;

import 'station.dart';

class StationApiException implements Exception {
  StationApiException(this.message);

  final String message;

  @override
  String toString() => 'StationApiException: $message';
}

class StationApi {
  StationApi({http.Client? client, String? baseUrl})
      : _client = client ?? http.Client(),
        _baseUrl = baseUrl ??
            const String.fromEnvironment(
              'API_BASE_URL',
              defaultValue: 'http://localhost:8080',
            );

  final http.Client _client;
  final String _baseUrl;

  Future<List<Station>> fetchStations() async {
    final response = await _client.get(Uri.parse('$_baseUrl/api/v1/stations'));
    if (response.statusCode != 200) {
      throw StationApiException('Server returned ${response.statusCode}');
    }
    final data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => Station.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}