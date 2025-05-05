abstract class SettingStorageRepository {
  Future<void> putLatestFromCurrencyBriefName(String briefName);
  Future<String?> getLatestFromCurrencyBriefName();
  Future<void> putLatestToCurrencyBriefName(String briefName);
  Future<String?> getLatestToCurrencyBriefName();
  Future<String> getAppLanguage();
  Future<void> putAppLanguage(String lang);
}