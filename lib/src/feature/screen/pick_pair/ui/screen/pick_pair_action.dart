import '../../../../../core/model/currency.dart';
import '../../../../../core/model/exchange_pair.dart';

sealed class PickPairAction {}

class PickPairActionSwapExchangePairs implements PickPairAction {}

class PickPairActionPickFromCurrency implements PickPairAction {}

class PickPairActionPickToCurrency implements PickPairAction {}

class PickPairActionSelectCurrency implements PickPairAction {
  final Currency currency;

  const PickPairActionSelectCurrency(this.currency);
}

class PickPairActionReloadCurrencies implements PickPairAction {}

class PickPairActionShowSearch implements PickPairAction {
  final bool show;

  PickPairActionShowSearch(this.show);
}

class PickPairActionSetSearchQuery implements PickPairAction {
  final String query;

  PickPairActionSetSearchQuery(this.query);
}

class PickPairActionSetExchangePair implements PickPairAction {
  final ExchangePair exchangePair;

  PickPairActionSetExchangePair(this.exchangePair);
}