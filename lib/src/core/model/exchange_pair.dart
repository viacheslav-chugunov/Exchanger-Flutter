import 'currency.dart';

class ExchangePair {
  Currency? fromCurrency;
  Currency? toCurrency;

  ExchangePair(this.fromCurrency, this.toCurrency);

  ExchangePair.empty() : fromCurrency = null, toCurrency = null;

  bool isNotEmpty() => fromCurrency != null && toCurrency != null;

  ExchangePair swap() => ExchangePair(toCurrency, fromCurrency);
}