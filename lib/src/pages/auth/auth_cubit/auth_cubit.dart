import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/view/login_page.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/register/view/register_page.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/splash_screen_cubit/splash_screen_callback.dart';

import '../pages/login/login_cubit/login_callback.dart';
import '../pages/splash_screen/view/splash_screen_page.dart';

part 'auth_state.dart';

class AuthCubit extends NavigationCubit<AuthState>
    implements LoginCallback, RegisterCallback, SplashScreenCallback {
  AuthCubit() : super(AuthState(pages: [SplashScreenPage.page()]));

  @override
  openCreateAccountPage() => emit(state.pushPage(RegisterPage.page()));

  @override
  onBackToLogin() => emit(state.pop());

  @override
  void onSplashScreenFinished() {
    emit(state.withPagesStack([LoginPage.page()]));
  }
}
