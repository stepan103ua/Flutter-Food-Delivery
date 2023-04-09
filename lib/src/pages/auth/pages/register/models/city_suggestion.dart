import 'package:equatable/equatable.dart';

class CitySuggestion extends Equatable {
  final String name;
  final String region;
  final String _lat;
  final String _lng;

  const CitySuggestion({
    required this.name,
    required this.region,
    required String lat,
    required String lng,
  })  : _lat = lat,
        _lng = lng;

  factory CitySuggestion.fromJson(dynamic data) => CitySuggestion(
        name: data['city'],
        region: data['admin_name'],
        lat: data['lat'],
        lng: data['lng'],
      );

  @override
  List<Object?> get props => [name, region, _lat, _lng];
}
