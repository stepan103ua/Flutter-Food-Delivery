import 'package:flutter/material.dart';
import '../values/theme/theme.dart';

class AppNavigationDestination extends StatelessWidget {
  final IconData unselectedIcon;
  final IconData selectedIcon;
  final String label;

  const AppNavigationDestination({
    super.key,
    required this.unselectedIcon,
    required this.selectedIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => NavigationDestination(
        icon: Icon(unselectedIcon),
        selectedIcon: Icon(
          selectedIcon,
          size:
              Theme.of(context).appNavigationDestinationTheme.selectedIconSize,
          color:
              Theme.of(context).appNavigationDestinationTheme.selectedIconColor,
        ),
        label: label,
      );
}
