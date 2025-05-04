sealed class RateAction {}

class RateActionSwapCurrencies implements RateAction {}

class RateActionRecalculateToCurrency implements RateAction {
  final String fromCurrencyInput;

  RateActionRecalculateToCurrency(this.fromCurrencyInput);
}

class RateActionRecalculateFromCurrency implements RateAction {
  final String toCurrencyInput;

  RateActionRecalculateFromCurrency(this.toCurrencyInput);
}