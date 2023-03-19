import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/login/view/login_page.dart';

part 'auth_state.dart';

class AuthCubit extends NavigationCubit<AuthState> {
  AuthCubit() : super(AuthState(pages: [LoginPage.page()]));
}
