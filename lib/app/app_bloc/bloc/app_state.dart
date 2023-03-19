part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  AppState get authentication => AppAuthentication();

  AppState get authenticated => AppAuthenticated();

  AppState get initializing => AppInitializing();

  @override
  List<Object> get props => [];
}

class AppAuthentication extends AppState {}

class AppAuthenticated extends AppState {}

class AppInitializing extends AppState {}
