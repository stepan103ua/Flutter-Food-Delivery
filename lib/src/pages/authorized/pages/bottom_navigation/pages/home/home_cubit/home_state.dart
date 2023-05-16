part of 'home_cubit.dart';

class HomeState extends Equatable with WithPageStack {
  @override
  final List<AppPage> pages;

  const HomeState({required this.pages});

  @override
  withPagesStack(List<AppPage> pages) => HomeState(pages: pages);

  @override
  List<Object> get props => [pages];
}
