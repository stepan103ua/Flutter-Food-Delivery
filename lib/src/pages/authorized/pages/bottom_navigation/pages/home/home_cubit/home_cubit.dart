import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/navigation/navigation_cubit.dart';

import '../../../../../../../navigation/navigation.dart';
import '../pages/category/view/category_page.dart';

part 'home_state.dart';

class HomeCubit extends NavigationCubit<HomeState> {
  HomeCubit() : super(HomeState(pages: [CategoryPage.page()]));
}
