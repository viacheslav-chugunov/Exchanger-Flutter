import 'package:exchanger/feature/network/di/network_graph.dart';

import 'di_graph.dart';

class AppGraph extends DiGraph {

  @override
  void init() {
    NetworkGraph().init();
  }

}

final appGraph = AppGraph();