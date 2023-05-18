import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/history/history_cubit/history_callback.dart';

import 'package:food_delivery/src/repositories/auth_repository.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({
    required AuthRepository repository,
    required HistoryCallback settingsCallback,
  })  : _repository = repository,
        _settingsCallback = settingsCallback,
        super(HistoryInitial());
  final AuthRepository _repository;
  final HistoryCallback _settingsCallback;

  Future<void> onLogout() async {
    try {
      await _repository.logout();
      _settingsCallback.onLogout();
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
