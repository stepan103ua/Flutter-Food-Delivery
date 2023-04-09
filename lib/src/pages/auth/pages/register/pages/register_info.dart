import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_cubit.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';
import 'package:food_delivery/src/widgets/inverted_elevated_button.dart';

class RegisterInfo extends StatelessWidget {
  const RegisterInfo({super.key});

  static const _subtitle = 'Enter your real name';
  static const _nameHint = 'Enter your name';
  static const _lastNameHint = 'Enter your last name';
  static const _emailNameHint = 'Enter your e-mail';
  static const _next = 'Next';
  static const _backToLogin = 'Back to login';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _subtitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            AppTextField(
              hint: _nameHint,
              onChanged: cubit.onNameChanged,
              isValid: state.name.isValid,
            ),
            const SizedBox(height: 20),
            AppTextField(
              hint: _lastNameHint,
              onChanged: cubit.onLastNameChanged,
              isValid: state.lastName.isValid,
            ),
            const SizedBox(height: 20),
            AppTextField(
              hint: _emailNameHint,
              onChanged: cubit.onEmailChanged,
              isValid: state.email.isValid,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: cubit.state.canGoToCity
                  ? context.read<RegisterCubit>().nextPage
                  : null,
              child: const Text(_next),
            ),
            const SizedBox(height: 20),
            InvertedElevatedButton(
              onPressed: context.read<RegisterCubit>().backToLogin,
              child: const Text(_backToLogin),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
