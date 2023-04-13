import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/src/extensions/list_extension.dart';

class AppPage extends Equatable {
  final Page page;

  const AppPage({required this.page});

  static List<Page> toPagesList(List<AppPage> pages) =>
      pages.map((e) => e.page).toList();

  @override
  List<Object?> get props => [page];
}

mixin WithPageStack<S> {
  List<AppPage> get pages;

  bool get canPop => pages.length > 1;

  S withPagesStack(List<AppPage> pages);

  S pushPage(AppPage page) => withPagesStack(pages + [page]);

  S removePage(AppPage page) => withPagesStack(pages - [page]);

  S pop() => withPagesStack(pages.sublist(0, pages.length - 1));
}
