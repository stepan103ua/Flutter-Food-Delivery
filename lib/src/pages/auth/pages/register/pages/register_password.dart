import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/widgets/app_text_field.dart';

import '../../../../../values/strings.dart';
import '../../../../../widgets/inverted_elevated_button.dart';
import '../register_cubit/register_cubit.dart';

class RegisterPassword extends StatelessWidget {
  const RegisterPassword({super.key});

  static const _subtitle = 'Create a password';
  static const _passwordHint = 'Password';
  static const _confirmPasswordHint = 'Confirm password';
  static const _createText = 'Create';

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _subtitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              AppTextField(
                hint: _passwordHint,
                onChanged: context.read<RegisterCubit>().onPasswordChanged,
                isPassword: true,
                isValid: state.password.isValid,
              ),
              const SizedBox(height: 20),
              AppTextField(
                hint: _confirmPasswordHint,
                onChanged:
                    context.read<RegisterCubit>().onConfirmPasswordChanged,
                isPassword: true,
                isValid: state.confirmPassword.isValid,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InvertedElevatedButton(
                    onPressed: context.read<RegisterCubit>().previousPage,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(Strings.back),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: state.canCreateAccount
                        ? context.read<RegisterCubit>().onCreateAccount
                        : null,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(_createText),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      );
}
