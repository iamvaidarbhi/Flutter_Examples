import 'package:flutter/foundation.dart';

class WeatherInfo with ChangeNotifier {
  String _tempType = "celcius";
  int _temparatureVal = 25;

  int get temperatureValue => _temparatureVal;
  String get temperaturetype => _tempType;

  set temperatureValue(int newTemp) {
    _temparatureVal = newTemp;
    notifyListeners();
  }

  set temperatureType(String newType) {
    _tempType = newType;
    notifyListeners();
  }
}
