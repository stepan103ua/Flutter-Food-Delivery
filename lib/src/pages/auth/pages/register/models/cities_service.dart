import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/city_suggestion.dart';

class CitiesService {
  Future<List<CitySuggestion>> loadCities() async {
    final citiesJson = await rootBundle.loadString('assets/json/cities.json');

    final data = json.decode(citiesJson) as List;

    final cities = data.map(CitySuggestion.fromJson).toList();

    cities.sort((a, b) => a.name.compareTo(b.name));

    return cities;
  }
}
