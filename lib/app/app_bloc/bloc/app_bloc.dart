import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';

part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
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
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }
}
