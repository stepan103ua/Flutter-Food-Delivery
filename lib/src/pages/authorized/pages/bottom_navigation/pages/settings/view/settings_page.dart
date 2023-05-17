import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/app_bloc/bloc/app_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/settings/settings_cubit/settings_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/settings/view/settings_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsCubit(
          repository: context.read(),
          settingsCallback: context.read<AppBloc>(),
        ),
        child: const SettingsView(),
      );
}
