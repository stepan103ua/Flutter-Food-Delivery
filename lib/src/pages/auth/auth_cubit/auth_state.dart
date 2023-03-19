part of 'auth_cubit.dart';

class AuthState extends Equatable with WithPageStack {
  @override
  final List<AppPage> pages;

  const AuthState({required this.pages});

  @override
  List<Object> get props => [pages];

  @override
  withPagesStack(List<AppPage> pages) => AuthState(pages: pages);
}
