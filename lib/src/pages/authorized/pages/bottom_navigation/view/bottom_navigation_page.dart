import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/view/bottom_navigation_view.dart';

import '../../../../../values/app_pages_names.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  static AppPage page() => const AppPage(
        page: CupertinoPage(
          key: ValueKey(AppPagesNames.bottomNavigation),
          name: AppPagesNames.bottomNavigation,
          child: BottomNavigationPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: const BottomNavigationView(),
      );
}
