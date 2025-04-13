import 'package:exchanger/feature/network/di/network_graph.dart';

import 'di_graph.dart';

class AppGraph extends DiGraph {

  @override
  void init() {
    NetworkGraph().init();
  }

  E inject<E extends Object>() {
    return di.get<E>();
  }

}

final appGraph = AppGraph();