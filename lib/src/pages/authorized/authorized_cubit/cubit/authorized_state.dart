part of 'authorized_cubit.dart';

class AuthorizedState extends Equatable with WithPageStack {
  const AuthorizedState({required this.pages});

  @override
  final List<AppPage> pages;

  @override
  withPagesStack(List<AppPage> pages) => AuthorizedState(pages: pages);

  @override
  List<Object> get props => [pages];
}