import 'package:exchanger/core/model/currency.dart';

import '../../../../../core/model/exchange_pair.dart';
import '../../model/picking_currency_type.dart';

class PickPairState {
  var loadingCurrencies = true;
  var failedToLoadCurrencies = false;
  List<Currency> currencies = [];
  var exchangePair = ExchangePair.empty();
  var pickingCurrency = PickingCurrencyType.from;

  String title() {
    String title;
    switch (pickingCurrency) {
      case PickingCurrencyType.from:
        title = "Pick first currency";
      case PickingCurrencyType.to:
        title = "Pick second currency";
      case PickingCurrencyType.none:
        title = "Pick a pair";
    }
    return title;
  }

  bool pairPicked() {
    return exchangePair.isNotEmpty();
  }
}