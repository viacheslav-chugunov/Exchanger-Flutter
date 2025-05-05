import 'package:dio/dio.dart';

import '../../../core/di/di_graph.dart';
import '../../../core/repository/currency_network_repository.dart';
import '../repository/default_currency_network_repository.dart';

class NetworkGraph extends DiGraph {
  @override
  Future<void> init() async {
    di.registerFactory<Dio>(() {
      return Dio();
    });
    di.registerFactory<CurrencyNetworkRepository>(() {
      return DefaultCurrencyNetworkRepository(inject());
    });
  }
}