import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'country_stats.dart';

class HttpHelper with ChangeNotifier {
  final CountryStats _countryStats = CountryStats();
  String get getCountryStatsString {
    return _countryStats.name!;
  }

  int get getCountryStatsCases {
    return _cases;
  }

  int get getCountryStatsDeaths {
    return _deaths;
  }

  int get getCountryStatsRecovered {
    return _recovered;
  }

  int _cases = 1000;
  int _deaths = 0;
  int _recovered = 0;

  Uri url = Uri.parse(
      "https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/1/query?f=json&where=(Country_Region=%27France%27)&returnGeometry=false&outFields=Country_Region,Confirmed,Recovered,Deaths");

  Future<void> getData() async {
    try {
      http.Response response =
          await http.get(url).timeout(const Duration(seconds: 3));
      Map<String, dynamic> data = json.decode(response.body);
      _cases = data["features"][0]["attributes"]["Confirmed"];
      _deaths = data["features"][0]["attributes"]["Deaths"];
      _recovered = data["features"][0]["attributes"]["Recovered"];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  final _headers = {'Content-Type': 'application/json'};
  Future<void> sendPostRequest(
      {required int cases, required int deaths, required int recovered}) async {
    final url = Uri.parse('http://192.168.4.1/post/data');
    final body =
        jsonEncode({'cases': cases, 'deaths': deaths, 'recovered': recovered});
    final response = await http.post(url, headers: _headers, body: body);

    if (response.statusCode == 200) {
      log('POST request succeeded');
    } else {
      log('POST request failed with status: ${response.statusCode}');
    }
  }

  Future<void> sendPump() async {
    final Uri url = Uri.parse('http://192.168.4.1/post');

    final body = jsonEncode({'value': true});
    final response = await http.post(url, headers: _headers, body: body);

    if (response.statusCode == 200) {
      log('POST request succeeded');
    } else {
      log('POST request failed with status: ${response.statusCode}');
    }
  }
}
