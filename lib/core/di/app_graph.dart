import 'package:exchanger/feature/network/di/network_graph.dart';

import '../../feature/storage/di/storage_graph.dart';
import 'di_graph.dart';

class AppGraph extends DiGraph {

  @override
  Future<void> init() async {
    await NetworkGraph().init();
    await StorageGraph().init();
  }

}

final appGraph = AppGraph();