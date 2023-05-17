import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/pages/authorized/authorized_cubit/cubit/authorized_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/cart_cubit/cart_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/order/order_cubit/order_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/order/view/order_view.dart';
import 'package:food_delivery/src/values/app_pages_names.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  static AppPage page() => const AppPage(
        page: CupertinoPage(
          key: ValueKey(AppPagesNames.order),
          name: AppPagesNames.order,
          child: OrderPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => OrderCubit(
          cartRepository: RepositoryProvider.of(context),
          repository: RepositoryProvider.of(context),
          authorizedCallback: context.read<AuthorizedCubit>(),
          cartCallback: context.read<CartCubit>(),
        ),
        child: const OrderView(),
      );
}
