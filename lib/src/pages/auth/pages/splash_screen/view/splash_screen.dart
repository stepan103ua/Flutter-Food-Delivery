import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:food_delivery/src/values/app_colors.dart';
import 'package:food_delivery/src/values/app_constants.dart';
import 'package:food_delivery/src/values/theme/theme.dart';

class SplashScreenView extends StatelessWidget {
  final Duration _animationDuration = const Duration(milliseconds: 1000);
  final Curve _gradientCurve = Curves.linearToEaseOut;
  final Curve _appNameCurve = Curves.fastLinearToSlowEaseIn;
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: mediaQuery.width,
        height: mediaQuery.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(splashScreenImagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocBuilder<SplashScreenCubit, SplashScreenState>(
          bloc: BlocProvider.of<SplashScreenCubit>(context)
            ..onStartAnimation(true),
          builder: (context, state) => Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: _animationDuration,
                curve: _gradientCurve,
                top: state.isAnimationStarted ? 75 : 1000,
                child: Container(
                  height: mediaQuery.height,
                  width: mediaQuery.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.greenBackground,
                        AppColors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: _animationDuration,
                curve: _appNameCurve,
                bottom: state.isAnimationStarted ? 150 : 0,
                child: AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: state.isAnimationStarted ? 1 : 0,
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Text(
                    appName,
                    style: Theme.of(context).textTheme.logoTitleLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
