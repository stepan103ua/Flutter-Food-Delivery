import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/splash_screen_cubit/splash_screen_callback.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit({required SplashScreenCallback callback})
      : _callback = callback,
        super(const SplashScreenInitial()) {
    _init();
  }

  final SplashScreenCallback _callback;

  void onStartAnimation(bool isAnimationStarted) async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.loaded(isAnimationStarted));
  }

  void _init() async {
    await Future.delayed(const Duration(milliseconds: 1600));
    _callback.onSplashScreenFinished();
  }
}
