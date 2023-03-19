import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependenciesProvider extends StatelessWidget {
  const DependenciesProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => FirebaseAuth.instance),
        ],
        child: child,
      );
}
