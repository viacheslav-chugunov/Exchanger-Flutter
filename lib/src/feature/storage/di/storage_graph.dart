import 'package:exchanger/src/core/core.dart';
import 'package:hive_flutter/adapters.dart';
import '../adapter/hive_box_names.dart';
import '../repository/default_setting_storage_repository.dart';

class StorageGraph extends DiGraph {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    final settingBox = await Hive.openBox<String>(settingBoxName);
    di.registerFactory<SettingStorageRepository>(() {
      return DefaultSettingStorageRepository(settingBox);
    });
  }

}