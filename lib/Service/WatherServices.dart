import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:last/models/weathermodel.dart';
class WeartherServices {
  String baseurk = 'http://api.weatherapi.com/v1';
  String APIKEY = '28a5d0c1de5942dda1724125232007';
  
  Future<weathermodel> GetWeather({required String CityName}) async {
    Uri url =
     Uri.parse('$baseurk/forecast.json?key=$APIKEY&q=$CityName&days=7');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    
    weathermodel weather = weathermodel.fromjseon(data);
    return weather;
  }
}
