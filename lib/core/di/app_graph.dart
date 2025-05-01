import 'package:exchanger/core/base/navigation_service.dart';
import 'package:exchanger/feature/network/di/network_graph.dart';
import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

import '../../feature/storage/di/storage_graph.dart';
import 'di_graph.dart';

class AppGraph extends DiGraph {

  @override
  Future<void> init() async {
    di.registerFactory<BuildContext>(() {
      return NavigationService.appContext();
    });
    di.registerFactory(() {
      return AppLocalizations.of(inject());
    });
    await NetworkGraph().init();
    await StorageGraph().init();
  }

}

final appGraph = AppGraph();