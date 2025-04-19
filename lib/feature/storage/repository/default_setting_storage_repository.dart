import 'package:exchanger/core/repository/setting_storage_repository.dart';
import 'package:hive_flutter/adapters.dart';

class DefaultSettingStorageRepository implements SettingStorageRepository {
  final Box<String> _box;

  DefaultSettingStorageRepository(this._box);

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

  static const String _latestFromCurrencyBriefNameKey = "latestFromCurrencyBriefName";
  static const String _latestToCurrencyBriefNameKey = "latestToCurrencyBriefName";
}