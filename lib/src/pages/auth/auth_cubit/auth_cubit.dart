import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/view/login_page.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_callback.dart';
import 'package:food_delivery/src/pages/auth/pages/register/view/register_page.dart';

import '../pages/login/login_cubit/login_callback.dart';

part 'auth_state.dart';

class AuthCubit extends NavigationCubit<AuthState>
    implements LoginCallback, RegisterCallback {
  AuthCubit() : super(AuthState(pages: [LoginPage.page()]));

  @override
  openCreateAccountPage() => emit(state.pushPage(RegisterPage.page()));

  @override
  onBackToLogin() => emit(state.pop());
}
