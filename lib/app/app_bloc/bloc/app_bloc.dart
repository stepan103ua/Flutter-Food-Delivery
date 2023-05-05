import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/auth/auth_cubit/auth_callback.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> implements AuthCallback {
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
}
