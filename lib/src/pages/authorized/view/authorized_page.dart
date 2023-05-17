import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/pages/authorized/authorized_cubit/cubit/authorized_cubit.dart';

import '../../../values/app_pages_names.dart';
import 'authorized_view.dart';

class AuthorizedPage extends StatelessWidget {
  const AuthorizedPage({super.key});

  static Page page() => const MaterialPage(
        key: ValueKey(AppPagesNames.authorized),
        name: AppPagesNames.authorized,
        child: AuthorizedPage(),
      );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => AuthorizedCubit(
          cartRepository: RepositoryProvider.of(context),
        ),
        child: const AuthorizedView(),
      );
}
