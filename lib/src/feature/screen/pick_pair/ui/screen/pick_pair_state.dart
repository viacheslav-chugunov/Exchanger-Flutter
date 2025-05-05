import 'package:exchanger/src/core/core.dart';
import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import '../../model/picking_currency_type.dart';

class PickPairState {
  var searchQuery = "";
  var showSearch = false;
  var loadingCurrencies = true;
  var failedToLoadCurrencies = false;
  List<Currency> currencies = [];
  ExchangePair? exchangePair;
  var pickingCurrency = PickingCurrencyType.none;

  String title(AppLocalizations localization) {
    if (loadingCurrencies || failedToLoadCurrencies) {
      return "";
    }

    String title;
    switch (pickingCurrency) {
      case PickingCurrencyType.from:
        title = localization.pickFirstCurrency;
      case PickingCurrencyType.to:
        title = localization.pickSecondCurrency;
      case PickingCurrencyType.none:
        title = localization.pickPair;
    }
    return title;
  }

  List<Currency> visibleCurrencies(AppLocalizations localization) {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return currencies;
    }
    return currencies.where((currency) {
      return currency.briefName.trim().toLowerCase().contains(query) ||
          currency.fullName(localization).trim().toLowerCase().contains(query);
    }).toList();
  }
}