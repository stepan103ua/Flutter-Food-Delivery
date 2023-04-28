part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState({required this.categories, required this.searchQuery});

  final List<Category> categories;
  final String searchQuery;

  CategoryState updatedCategories(List<Category> categories) =>
      CategoriesUpdated(categories, searchQuery);

  CategoryState loadingError(String errorMessage) =>
      CategoriesLoadedError(errorMessage: errorMessage);

  @override
  List<Object> get props => [categories, searchQuery];
}

class CategoriesInitial extends CategoryState {
  const CategoriesInitial({
    super.categories = const [],
    super.searchQuery = '',
  });
}

class CategoriesUpdated extends CategoryState {
  const CategoriesUpdated(List<Category> categories, String searchQuery)
      : super(categories: categories, searchQuery: searchQuery);
}

class CategoriesLoadedError extends CategoryState {
  final String errorMessage;
  const CategoriesLoadedError({
    required this.errorMessage,
    super.categories = const [],
    super.searchQuery = '',
  });
}
