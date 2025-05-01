import 'package:exchanger/core/model/async_result.dart';

import '../../l10n/gen_l10n/app_localizations.dart';
import '../model/currency.dart';

abstract interface class CurrencyNetworkRepository {
  Future<AsyncResult<List<Currency>>> currencies();
}