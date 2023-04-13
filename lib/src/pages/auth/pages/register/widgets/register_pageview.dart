import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/auth/pages/register/pages/register_city.dart';
import 'package:food_delivery/src/pages/auth/pages/register/pages/register_password.dart';
import 'package:food_delivery/src/pages/auth/pages/register/register_cubit/register_cubit.dart';

import '../pages/register_info.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  late final PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.step.index == _controller.page!.toInt()) {
            return;
          }
          _controller.animateToPage(
            state.step.index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        child: Expanded(
          child: PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              RegisterInfo(),
              RegisterCity(),
              RegisterPassword(),
            ],
          ),
        ),
      );
}
