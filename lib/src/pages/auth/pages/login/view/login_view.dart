import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/login/login_cubit/login_cubit.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';
import 'package:food_delivery/src/widgets/inverted_elevated_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const _title = 'Login';
  static const _subTitle = 'Sign in to continue';
  static const _loginText = 'Log in';
  static const _registerText = 'Create account';
  static const _emailHint = 'Enter your e-mail';
  static const _passwordHint = 'Enter your password';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 70,
            ),
            Text(
              _title,
              style: textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              _subTitle,
              style: textTheme.titleMedium,
            ),
            Expanded(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppTextField(
                      hint: _emailHint,
                      isValid: state.email.isValid,
                      onChanged: context.read<LoginCubit>().onEmailUpdate,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      hint: _passwordHint,
                      isValid: state.password.isValid,
                      isPassword: true,
                      onChanged: context.read<LoginCubit>().onPasswordUpdate,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: state.isValid
                          ? context.read<LoginCubit>().onLoginPressed
                          : null,
                      child: const Text(_loginText),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InvertedElevatedButton(
                      onPressed:
                          context.read<LoginCubit>().onCreateAccountPressed,
                      child: const Text(_registerText),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
