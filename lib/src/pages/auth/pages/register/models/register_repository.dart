import 'package:food_delivery/src/pages/auth/pages/register/models/cities_service.dart';
import 'package:food_delivery/src/pages/auth/pages/register/models/city_suggestion.dart';

class RegisterRepository {
  final CitiesService _citiesService;

  RegisterRepository({required CitiesService citiesService})
      : _citiesService = citiesService;

  Future<List<CitySuggestion>> getCitiesSuggestions() =>
      _citiesService.loadCities();

  List<CitySuggestion> searchCitiesSuggestions({
    required List<CitySuggestion> loadedSuggestion,
    required String query,
  }) {
    final foundCities = loadedSuggestion
        .where(
          (element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()),
        )
        .toList();

    return foundCities;
  }
}
