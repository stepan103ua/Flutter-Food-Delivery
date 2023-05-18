import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/history_cubit/history_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/view/history_order_item.dart';
import 'package:food_delivery/src/values/app_colors.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          backgroundColor: AppColors.greenBackground,
          actions: [
            IconButton(
              onPressed: () => context.read<HistoryCubit>().onLogout(),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HistoryOrderItem(
                  title: 'Borsh',
                  date: '18.05.2023 07:45',
                  imageUrl:
                      'https://images.unsplash.com/photo-1527976746453-f363eac4d889?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Ym9yc2h8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                  price: 100,
                  quantity: 2,
                  username: 'Rostyslav',
                  surname: 'Yovbak',
                  phoneNumber: '+380999999999',
                ),
                SizedBox(
                  height: 20,
                ),
                HistoryOrderItem(
                  title: 'Salad',
                  date: '18.05.2023 07:45',
                  imageUrl:
                      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                  price: 120,
                  quantity: 2,
                  username: 'Stepan',
                  surname: 'Dobryanskyi',
                  phoneNumber: '+380888888888',
                ),
                SizedBox(
                  height: 20,
                ),
                HistoryOrderItem(
                  title: 'French fries',
                  date: '18.05.2023 07:45',
                  imageUrl:
                      'https://images.unsplash.com/photo-1541592106381-b31e9677c0e5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZnJlbmNoJTIwZnJpZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
                  price: 70,
                  quantity: 2,
                  username: 'Rostyslav',
                  surname: 'Yovbak',
                  phoneNumber: '+38077777777',
                ),
              ],
            ),
          ),
        ),
      );
}
