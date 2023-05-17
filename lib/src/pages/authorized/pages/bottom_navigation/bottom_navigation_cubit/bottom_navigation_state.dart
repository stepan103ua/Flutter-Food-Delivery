part of 'bottom_navigation_cubit.dart';

enum AuthorizedBottomNavigationPage {
  home,
  cart,
  settings,
}

abstract class BottomNavigationState extends Equatable {
  final AuthorizedBottomNavigationPage page;

  const BottomNavigationState({required this.page});

  BottomNavigationState updatedPage(AuthorizedBottomNavigationPage page) =>
      BottomNavigationUpdated(page: page);

  @override
  List<Object> get props => [page];
}

class BottomNavigationInitial extends BottomNavigationState {
  const BottomNavigationInitial({required super.page});
}

class BottomNavigationUpdated extends BottomNavigationState {
  const BottomNavigationUpdated({required super.page});
}
