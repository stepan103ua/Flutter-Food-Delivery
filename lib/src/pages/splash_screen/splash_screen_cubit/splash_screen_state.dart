part of 'splash_screen_cubit.dart';

abstract class SplashScreenState extends Equatable {
  final bool isAnimationStarted;

  const SplashScreenState({required this.isAnimationStarted});

  SplashScreenState loaded(bool isAnimationStarted) =>
      SplashScreenLoaded(isAnimationStarted: isAnimationStarted);

  @override
  List<Object> get props => [isAnimationStarted];
}

class SplashScreenInitial extends SplashScreenState {
  const SplashScreenInitial() : super(isAnimationStarted: false);
}

class SplashScreenLoaded extends SplashScreenState {
  const SplashScreenLoaded({required super.isAnimationStarted});
}
