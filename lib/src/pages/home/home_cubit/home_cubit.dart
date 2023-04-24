import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/pages/home/pages/category/category_cubit/category_callback.dart';

import '../../../navigation/navigation.dart';
import '../pages/category/view/category_page.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with CategoryCallback {
  HomeCubit() : super(HomeState(pages: [CategoryPage.page()]));

  @override
  openCategoryPage() => emit(state.pushPage(CategoryPage.page()));
}
