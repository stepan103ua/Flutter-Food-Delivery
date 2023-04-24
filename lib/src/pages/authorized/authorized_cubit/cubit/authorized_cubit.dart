import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authorized_state.dart';

class AuthorizedCubit extends Cubit<AuthorizedState> {
  AuthorizedCubit() : super(AuthorizedInitial());
}
