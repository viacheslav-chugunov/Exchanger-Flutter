import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:exchanger/src/core/core.dart';
import 'package:hive_flutter/adapters.dart';

class DefaultSettingStorageRepository implements SettingStorageRepository {
  static const String _latestFromCurrencyBriefNameKey = "latestFromCurrencyBriefName";
  static const String _latestToCurrencyBriefNameKey = "latestToCurrencyBriefName";
  static const String _appLanguageKey = "appLanguage";

  final AppLocalizations _localization;
  final Box<String> _box;

  DefaultSettingStorageRepository(this._box, this._localization);

  @override
  Future<String?> getLatestFromCurrencyBriefName() async {
    return _box.get(_latestFromCurrencyBriefNameKey);
  }

  @override
  Future<String?> getLatestToCurrencyBriefName() async {
    return _box.get(_latestToCurrencyBriefNameKey);
  }

  @override
  Future<void> putLatestFromCurrencyBriefName(String briefName) async {
    return _box.put(_latestFromCurrencyBriefNameKey, briefName);
  }

  @override
  Future<void> putLatestToCurrencyBriefName(String briefName) async {
    return _box.put(_latestToCurrencyBriefNameKey, briefName);
  }

  @override
  Future<String> getAppLanguage() async {
    return _box.get(_appLanguageKey) ?? _localization.language;
  }

  @override
  Future<void> putAppLanguage(String lang) {
    return _box.put(_appLanguageKey, lang);
  }
}