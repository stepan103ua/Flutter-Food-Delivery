import 'package:flutter/material.dart';
import 'package:food_delivery/src/values/app_colors.dart';

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
            const SizedBox(
              height: 160,
            ),
            const TextField(
              decoration: InputDecoration(hintText: _emailHint),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: _passwordHint,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                _loginText,
                style: textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child: const Text(
                _registerText,
                style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
