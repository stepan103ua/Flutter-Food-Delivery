import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/src/errors/api_error.dart';
import 'package:food_delivery/src/pages/authorized/pages/bottom_navigation/pages/settings/settings_cubit/settings_callback.dart';

import 'package:food_delivery/src/repositories/auth_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required AuthRepository repository,
    required SettingsCallback settingsCallback,
  })  : _repository = repository,
        _settingsCallback = settingsCallback,
        super(SettingsInitial());
  final AuthRepository _repository;
  final SettingsCallback _settingsCallback;

  Future<void> onLogout() async {
    try {
      await _repository.logout();
      _settingsCallback.onLogout();
    } on ApiError catch (error) {
      return Future.error(error);
    }
  }
}
