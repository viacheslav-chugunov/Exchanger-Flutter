import 'currency.dart';

class ExchangePair {
  Currency fromCurrency;
  Currency toCurrency;

  ExchangePair(this.fromCurrency, this.toCurrency);

  ExchangePair swap() => ExchangePair(toCurrency, fromCurrency);
}