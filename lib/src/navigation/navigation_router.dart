import 'package:flutter/material.dart';

import 'navigation_cubit.dart';
import 'navigation_router_delegate.dart';

class NavigationRouter extends StatefulWidget {
  const NavigationRouter({super.key, required this.navigationCubit});

  final NavigationCubit navigationCubit;

  @override
  State<NavigationRouter> createState() => _NavigationRouterState();
}

class _NavigationRouterState extends State<NavigationRouter> {
  final navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => Router(
        routerDelegate: NavigationRouterDelegate(
          navigatorKey: navigationKey,
          navigationCubit: widget.navigationCubit,
        ),
        backButtonDispatcher: RootBackButtonDispatcher(),
      );
}
