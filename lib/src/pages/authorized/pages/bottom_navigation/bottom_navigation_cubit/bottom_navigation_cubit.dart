import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit()
      : super(
          const BottomNavigationInitial(
            page: AuthorizedBottomNavigationPage.home,
          ),
        );

  void setPageByIndex(int index) =>
      emit(state.updatedPage(AuthorizedBottomNavigationPage.values[index]));
}
