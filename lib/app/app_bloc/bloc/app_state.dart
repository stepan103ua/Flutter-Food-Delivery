part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppAuthentication extends AppState {}

class AppAuthenticated extends AppState {}

class AppInitializing extends AppState {}
