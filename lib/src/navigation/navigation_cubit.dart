import 'package:bloc/bloc.dart';
import '../navigation/navigation.dart';

class NavigationCubit<S extends WithPageStack> extends Cubit<S> {
  NavigationCubit(super.initialState);

  bool onPopPage(dynamic result) {
    if (state.canPop) {
      emit(state.pop());
      return true;
    }
    return false;
  }
}
