import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_callback.dart';
import 'package:food_delivery/src/pages/splash_screen/models/initialization_result.dart';
import 'package:food_delivery/src/pages/splash_screen/splash_screen_cubit/splash_screen_callback.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState>
    implements AuthCallback, SplashScreenCallback {
  late final StreamSubscription _authSubscription;

  AppBloc() : super(AppInitializing()) {
    on<AppGoToAuthenticationEvent>(_onGoToAuthenticationEvent);
    on<AppGoToAuthenticatedEvent>(_onGoToAuthenticatedEvent);

    //_init();
  }

  void _onGoToAuthenticationEvent(
    AppGoToAuthenticationEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.authentication);
  }

  void _onGoToAuthenticatedEvent(
    AppGoToAuthenticatedEvent event,
    Emitter<AppState> emit,
  ) {
    emit(state.authenticated);
  }

  @override
  void onAuthenticated() {
    add(AppGoToAuthenticatedEvent());
  }

  @override
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }

  @override
  void onSplashScreenFinished(result) {
    switch (result) {
      case InitializationResult.authorized:
        add(AppGoToAuthenticatedEvent());
        break;
      case InitializationResult.notAuthorized:
        add(AppGoToAuthenticationEvent());
        break;
    }
  }
}
