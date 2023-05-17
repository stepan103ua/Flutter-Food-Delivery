import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/settings/settings_cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            onPressed: () => context.read<SettingsCubit>().onLogout(),
            style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.all(10),
              ),
            ),
            child: const Text('Logout'),
          ),
        ),
      );
}
