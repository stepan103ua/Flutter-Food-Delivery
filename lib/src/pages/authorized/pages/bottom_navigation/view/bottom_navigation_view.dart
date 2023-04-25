import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/home/view/home_page.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) => Scaffold(
          body: Stack(
            children: [
              Offstage(
                offstage: state.page == AuthorizedBottomNavigationPage.home,
                child: const HomePage(),
              ),
              Offstage(
                offstage: state.page == AuthorizedBottomNavigationPage.cart,
                child: const HomePage(),
              ),
              Offstage(
                offstage: state.page == AuthorizedBottomNavigationPage.history,
                child: const HomePage(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_rounded),
                label: 'History',
              ),
            ],
            onTap: context.read<BottomNavigationCubit>().setPageByIndex,
            currentIndex: state.page.index,
          ),
        ),
      );
}
