import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_cubit.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_message.dart';
import 'package:food_delivery/src/pages/auth/pages/register/widgets/register_pageview.dart';
import 'package:food_delivery/src/widgets/message_handler.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const _title = 'Registration';

  @override
  Widget build(BuildContext context) =>
      MessageHandler<RegisterCubit, RegisterState>(
        handler: (message) {
          if (message is FailedToRegisterMessage) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Failed to register'),
                content: Text(message.errorMessage),
                actions: [
                  TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text('Ok'),
                  ),
                ],
              ),
            ).then((_) => context.read<RegisterCubit>().popMessage(message));
          }
        },
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  RegisterView._title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const RegisterPageView(),
            ],
          ),
        ),
      );
}
