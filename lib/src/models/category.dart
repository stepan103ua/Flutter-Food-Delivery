import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  const Category({
    required this.name,
    required this.imageUrl,
  });

  factory Category.fromJson(dynamic json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [name, imageUrl];
}
