import 'package:flutter/cupertino.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/cart/pages/cart_items/view/cart_items_view.dart';

import '../../../../../../../../../navigation/navigation.dart';
import '../../../../../../../../../values/app_pages_names.dart';

class CartItemsPage extends StatelessWidget {
  const CartItemsPage({super.key});

  static AppPage page() => const AppPage(
        page: CupertinoPage(
          key: ValueKey(AppPagesNames.cartItems),
          name: AppPagesNames.cartItems,
          child: CartItemsPage(),
        ),
      );

  @override
  Widget build(BuildContext context) => const CartItemsView();
}
