import 'package:exchanger/core/model/async_result.dart';

import '../model/currency.dart';

abstract interface class CurrencyNetworkRepository {
  Future<AsyncResult<List<Currency>>> currencies();
}