import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:exchanger/src/feature/screen/settings/ui/screen/settings_action.dart';
import 'package:exchanger/src/feature/screen/settings/ui/screen/settings_view_model.dart';
import 'package:flutter/material.dart';

import '../component/setting_switch_component.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late SettingsViewModel viewModel;

  @override
  void initState() {
    viewModel = SettingsViewModel(() {setState(() {});});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.settings),
      ),
      body: Column(
        children: [
          SettingSwitchComponent(
              title: localization.language,
              value: state.language,
              onSwitch: () {
                viewModel.handle(SettingsActionSwitchLanguage());
              }
          )
        ],
      )
    );
  }
}