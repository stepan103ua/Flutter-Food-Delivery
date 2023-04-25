import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/view/bottom_navigation_page.dart';

part 'authorized_state.dart';

class AuthorizedCubit extends NavigationCubit<AuthorizedState> {
  AuthorizedCubit()
      : super(AuthorizedState(pages: [BottomNavigationPage.page()]));
}
