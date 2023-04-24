import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final FirebaseAuth _auth;
  late final StreamSubscription _authSubscription;

  AppBloc({required FirebaseAuth firebaseAuth})
      : _auth = firebaseAuth,
        super(AppInitializing()) {
    on<AppGoToAuthenticationEvent>(_onGoToAuthenticationEvent);
    on<AppGoToAuthenticatedEvent>(_onGoToAuthenticatedEvent);

    _init();
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

  void _init() {
    // _authSubscription = _auth.userChanges().listen(_onUserChange);
  }

  void _onUserChange(User? user) {
    add(
      user == null ? AppGoToAuthenticationEvent() : AppGoToAuthenticatedEvent(),
    );
  }

  @override
  Future<void> close() async {
    await _authSubscription.cancel();
    return super.close();
  }
}
