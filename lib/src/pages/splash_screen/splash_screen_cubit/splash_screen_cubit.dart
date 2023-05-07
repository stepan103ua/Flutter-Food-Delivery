import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/splash_screen_repository.dart';
import 'splash_screen_callback.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit({
    required SplashScreenCallback callback,
    required SplashScreenRepository repository,
  })  : _callback = callback,
        _repository = repository,
        super(const SplashScreenInitial()) {
    _init();
  }

  final SplashScreenCallback _callback;
  final SplashScreenRepository _repository;

  void onStartAnimation(bool isAnimationStarted) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.loaded(isAnimationStarted));
  }

  void _init() async {
    final result = await Future.wait([
      _repository.isAuthorized,
      Future.delayed(const Duration(milliseconds: 1600)),
    ]);
    _callback.onSplashScreenFinished(result.first);
  }
}
