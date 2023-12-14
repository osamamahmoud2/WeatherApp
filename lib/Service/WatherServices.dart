import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/models/weathermodel.dart';

class WeartherServices {
  String baseurk = 'http://api.weatherapi.com/v1';
  String APIKEY = '28a5d0c1de5942dda1724125232007';

  Future<weathermodel> GetWeather({required String CityName}) async {
    http.Response response = await http
        .get(Uri.parse('$baseurk/forecast.json?key=$APIKEY&q=$CityName'));
    Map<String, dynamic> data = jsonDecode(response.body);

    weathermodel weather = weathermodel.fromjson(data);
    return weather;
  }
}
