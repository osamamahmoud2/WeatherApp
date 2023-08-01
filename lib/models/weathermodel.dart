import 'package:flutter/material.dart' show Colors, MaterialColor;

class weathermodel
{
  String data;
  String name;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatname;

  weathermodel(
      {required this.data,
      required this.name,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherstatname});

  factory weathermodel.fromjseon(dynamic data) {
    var jsondata = data['forecast']['forecastday'][0]['day'];
    return weathermodel(
      name: data['location']['name'],
        data: data['location']['localtime'],
        temp: jsondata['avgtemp_c'],
        maxtemp: jsondata['maxtemp_c'],
        mintemp: jsondata['mintemp_c'],
        weatherstatname: jsondata['condition']['text']);
  }
  @override
  String toString() {
    return 'tem= $temp mintemp= $mintemp data= $data';
  }
  String getiamge()
  {
    if(weatherstatname== 'Clear'||weatherstatname=='Light Cloud')
    {
      return 'assets/images/clear.png';
    }else if(weatherstatname=='Sleet'||weatherstatname=='Snow'||weatherstatname=='Hail'){
    return 'assets/images/snow.png';
    }else if(weatherstatname=='Heavy Cloudy'){
      return 'assets/images/cloudy.png';
    }else if(weatherstatname=='Light Rain'||weatherstatname=='Heavy Rain'||weatherstatname=='Showers'){
      return 'assets/images/rainy.png';

    }else if(weatherstatname=='Thunderstorm'||weatherstatname=='osama'){
      return 'assets/images/thunderstorm.png';
    }else{
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getthemcolor()
  {
    if(weatherstatname== 'Clear'||weatherstatname=='Light Cloud')
    {
      return Colors.orange;
    }else if(weatherstatname=='Sleet'||weatherstatname=='Snow'||weatherstatname=='Hail'){
    return Colors.blue;
    }else if(weatherstatname=='Heavy Cloudy'){
      return Colors.blueGrey;
    }else if(weatherstatname=='Light Rain'||weatherstatname=='Heavy Rain'||weatherstatname=='Showers'){
      return Colors.blue;

    }else if(weatherstatname=='Thunderstorm'||weatherstatname=='osama'){
      return Colors.blue;
    }else{
      return Colors.orange;
    }
  }
}

