import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/view/login_page.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/splash_screen_cubit/splash_screen_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/splash_screen/view/splash_screen_page.dart';

part 'auth_state.dart';

class AuthCubit extends NavigationCubit<AuthState>
    implements SplashScreenCallback {
  AuthCubit() : super(AuthState(pages: [SplashScreenPage.page()]));

  @override
  void onSplashScreenFinished() {
    emit(state.withPagesStack([LoginPage.page()]));
  }
}
