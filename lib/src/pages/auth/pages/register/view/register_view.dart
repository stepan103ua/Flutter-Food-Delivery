import 'package:flutter/material.dart';
import 'package:food_delivery/src/pages/auth/pages/register/widgets/register_pageview.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  static const _title = 'Registration';

  @override
  Widget build(BuildContext context) => Scaffold(
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
      );
}
