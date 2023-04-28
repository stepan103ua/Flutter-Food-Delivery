import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_requests.g.dart';

@JsonSerializable()
class CategoriesRequests extends Equatable {
  final String searchQuery;

  const CategoriesRequests({
    required this.searchQuery,
  });

  factory CategoriesRequests.fromJson(Map<String, dynamic> json) =>
      _$CategoriesRequestsFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesRequestsToJson(this);

  @override
  List<Object?> get props => [searchQuery];
}
