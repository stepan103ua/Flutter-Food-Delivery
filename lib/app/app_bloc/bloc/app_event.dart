part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppGoToAuthenticationEvent extends AppEvent {}

class AppGoToAuthenticatedEvent extends AppEvent {}
