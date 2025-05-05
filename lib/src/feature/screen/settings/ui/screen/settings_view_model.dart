import 'package:exchanger/src/core/core.dart';
import 'package:exchanger/src/feature/screen/settings/ui/screen/settings_action.dart';
import 'package:exchanger/src/feature/screen/settings/ui/screen/settings_state.dart';

class SettingsViewModel extends ViewModel<SettingsState, SettingsAction> {
  final SettingStorageRepository _settingStorageRepository = appGraph.inject();

  SettingsViewModel(Function emit) : super(SettingsState(), emit) {
    _loadCurrentLanguage();
  }

  @override
  void handle(SettingsAction action) async {
    switch (action) {
      case SettingsActionSwitchLanguage():
        state.language = state.language == "en" ? "ru" : "en";
        await _settingStorageRepository.putAppLanguage(state.language);
        emit();
    }
  }

  Future<void> _loadCurrentLanguage() async {
    state.language = await _settingStorageRepository.getAppLanguage();
    emit();
  }

}