import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/src/models/with_messages.dart';

import '../models/message.dart';

class MessageHandler<B extends StateStreamable<S>, S extends WithMessages>
    extends StatelessWidget {
  const MessageHandler({
    super.key,
    required this.child,
    required this.handler,
  });

  final Widget child;
  final void Function(Message) handler;

  @override
  Widget build(BuildContext context) => BlocListener<B, S>(
        listener: (context, state) {
          log("UPDATED");
          if (state.lastMessage != null) {

            handler(state.lastMessage!);
          }
        },
        child: child,
      );
}
