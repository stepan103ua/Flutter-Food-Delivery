import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/view/cart_page.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/view/history_page.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/view/home_page.dart';
import 'package:food_delivery/src/widgets/app_navigation_destination.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  static const _homeLabel = 'Home';
  static const _cartLabel = 'Cart';
  static const _historyLabel = 'History';

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) => Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Offstage(
                  offstage: state.page != AuthorizedBottomNavigationPage.home,
                  child: const HomePage(),
                ),
                Offstage(
                  offstage: state.page != AuthorizedBottomNavigationPage.cart,
                  child: const CartPage(),
                ),
                Offstage(
                  offstage:
                      state.page != AuthorizedBottomNavigationPage.history,
                  child: const HistoryPage(),
                ),
              ],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: const [
              AppNavigationDestination(
                unselectedIcon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: _homeLabel,
              ),
              AppNavigationDestination(
                unselectedIcon: Icons.shopping_cart_outlined,
                selectedIcon: Icons.shopping_cart,
                label: _cartLabel,
              ),
              AppNavigationDestination(
                unselectedIcon: Icons.history_outlined,
                selectedIcon: Icons.history,
                label: _historyLabel,
              ),
            ],
            onDestinationSelected:
                context.read<BottomNavigationCubit>().setPageByIndex,
            selectedIndex: state.page.index,
          ),
        ),
      );
}
