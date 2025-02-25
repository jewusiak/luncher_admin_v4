import 'dart:convert';
import 'package:flutter/services.dart';

class FFDevEnvironmentValues {
  static const String currentEnvironment = 'PRE';
  static const String environmentValuesPath =
      'assets/environment_values/environment.json';

  static final FFDevEnvironmentValues _instance =
      FFDevEnvironmentValues._internal();

  factory FFDevEnvironmentValues() {
    return _instance;
  }

  FFDevEnvironmentValues._internal();

  Future<void> initialize() async {
    try {
      final String response =
          await rootBundle.loadString(environmentValuesPath);
      final data = await json.decode(response);
      _backendurl = data['backendurl'];
      _mapsPlacesKey = data['mapsPlacesKey'];
      _importsbackendurl = data['importsbackendurl'];
    } catch (e) {
      print('Error loading environment values: $e');
    }
  }

  String _backendurl = '';
  String get backendurl => _backendurl;

  String _mapsPlacesKey = '';
  String get mapsPlacesKey => _mapsPlacesKey;

  String _importsbackendurl = '';
  String get importsbackendurl => _importsbackendurl;
}
