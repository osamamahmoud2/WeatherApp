import 'package:flutter/material.dart';
import 'package:last/models/weathermodel.dart';

class Weatherprovider extends ChangeNotifier
{
  weathermodel? _weatherdata;
  set weatherdata (weathermodel? weather)
  {
    _weatherdata =weather;
  notifyListeners();
  }
  weathermodel? get weatherdata => _weatherdata;
}