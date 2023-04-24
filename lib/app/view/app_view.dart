import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/app_bloc/bloc/app_bloc.dart';
import 'package:food_delivery/src/pages/auth/view/auth_page.dart';
import 'package:food_delivery/src/pages/authorized/view/authorized_page.dart';
import 'package:food_delivery/src/values/theme.dart';

class FoodDeliveryAppView extends StatelessWidget {
  const FoodDeliveryAppView({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => MaterialApp(
          theme: theme,
          home: Navigator(
            pages: [
              AuthorizedPage.page(),
            ],
            onPopPage: (route, result) => route.didPop(result),
          ),
        ),
      );
}
