import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../models/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
}
