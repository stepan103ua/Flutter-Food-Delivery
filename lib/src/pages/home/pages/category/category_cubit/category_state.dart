part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  final List<Category> categories;
  final String searchQuery;

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}
