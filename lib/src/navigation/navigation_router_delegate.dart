import 'dart:async';

import 'package:flutter/material.dart';

import 'navigation.dart';
import 'navigation_cubit.dart';

class NavigationRouterDelegate extends RouterDelegate<Page>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  NavigationRouterDelegate({
    required this.navigatorKey,
    required NavigationCubit navigationCubit,
  })  : _pages = AppPage.toPagesList(navigationCubit.state.pages),
        _navigationCubit = navigationCubit {
    _streamSubscription = _navigationCubit.stream.listen(_onStateChange);
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final NavigationCubit _navigationCubit;

  final List<Page> _pages;

  late final StreamSubscription _streamSubscription;

  @override
  Widget build(BuildContext context) => Navigator(
        pages: List.unmodifiable(_pages),
        key: navigatorKey,
        onPopPage: _onPopPage,
      );

  @override
  Future<void> setNewRoutePath(Page configuration) => Future.value();

  _onStateChange(WithPageStack state) {
    _pages.clear();
    _pages.addAll(AppPage.toPagesList(state.pages));

    notifyListeners();
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    } else {
      return _navigationCubit.onPopPage(result);
    }
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
