part of 'authorized_cubit.dart';

abstract class AuthorizedState extends Equatable {
  const AuthorizedState();

  @override
  List<Object> get props => [];
}

class AuthorizedInitial extends AuthorizedState {}
