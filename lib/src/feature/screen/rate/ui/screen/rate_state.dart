import 'package:exchanger/src/core/core.dart';

class RateState {
  ExchangePair exchangePair;
  var fromCurrencyInput = "";
  var toCurrencyInput = "";

  RateState(this.exchangePair);

  String fromIconPath() => exchangePair.fromCurrency?.imagePath ?? "";

  String toIconPath() => exchangePair.toCurrency?.imagePath ?? "";

  String fromHint() => exchangePair.fromCurrency?.fullName ?? "";

  String toHint() => exchangePair.toCurrency?.fullName ?? "";

  String fromBrief() => exchangePair.fromCurrency?.briefName ?? "";

  String toBrief() => exchangePair.toCurrency?.briefName ?? "";

  String title() => fromBrief().isNotEmpty && toBrief().isNotEmpty ? "${fromBrief()}  /  ${toBrief()}" : "";

  num fromRate() => exchangePair.fromCurrency?.rate ?? -1;

  num toRate() => exchangePair.toCurrency?.rate ?? -1;

  num rate() => fromRate() != -1 && toRate() != -1 ? toRate() / fromRate() : -1;

  String rateString() => rate() == -1 ? "" : "1 ${fromBrief()} = ${rate().toStringAsFixed(2)} ${toBrief()}";
}