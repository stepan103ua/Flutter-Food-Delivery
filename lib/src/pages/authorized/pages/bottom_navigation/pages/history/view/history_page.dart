import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/history_cubit/history_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/view/history_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HistoryCubit(),
        child: const HistoryView(),
      );
}
