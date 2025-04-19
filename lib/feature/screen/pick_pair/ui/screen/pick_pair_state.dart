import 'package:exchanger/core/model/currency.dart';

import '../../../../../core/model/exchange_pair.dart';
import '../../model/picking_currency_type.dart';

class PickPairState {
  var searchQuery = "";
  var showSearch = false;
  var loadingCurrencies = true;
  var failedToLoadCurrencies = false;
  List<Currency> currencies = [];
  var exchangePair = ExchangePair.empty();
  var pickingCurrency = PickingCurrencyType.none;

  String title() {
    if (loadingCurrencies || failedToLoadCurrencies) {
      return "";
    }

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

  List<Currency> visibleCurrencies() {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return currencies;
    }
    return currencies.where((currency) {
      return currency.briefName.trim().toLowerCase().contains(query) ||
          currency.fullName.trim().toLowerCase().contains(query);
    }).toList();
  }
}