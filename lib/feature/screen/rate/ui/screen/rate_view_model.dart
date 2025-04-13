import 'package:exchanger/feature/screen/rate/ui/screen/rate_action.dart';
import 'package:exchanger/feature/screen/rate/ui/screen/rate_state.dart';

import '../../../../../core/base/view_model.dart';
import '../../../../../core/model/exchange_pair.dart';

class RateViewModel extends ViewModel<RateState, RateAction> {

  RateViewModel(Function() emit, ExchangePair exchangePair) : super(RateState(exchangePair), emit);

  @override
  void handle(RateAction action) {
    switch (action) {
      case RateActionSwapCurrencies():
        final temp = state.fromCurrencyInput;
        state.fromCurrencyInput = state.toCurrencyInput;
        state.toCurrencyInput = temp;
        state.exchangePair = state.exchangePair.swap();
        emit();

      case RateActionRecalculateToCurrency():
        state.fromCurrencyInput = action.fromCurrencyInput;
        if (action.fromCurrencyInput.isNotEmpty) {
          final intInput = num.parse(action.fromCurrencyInput);
          if (intInput > 0) {
            state.toCurrencyInput = (intInput * state.rate()).toStringAsFixed(2);
          } else {
            state.toCurrencyInput = "";
          }
        } else {
          state.toCurrencyInput = "";
        }
        emit();

      case RateActionRecalculateFromCurrency():
        state.toCurrencyInput = action.toCurrencyInput;
        if (action.toCurrencyInput.isNotEmpty) {
          final intInput = num.parse(action.toCurrencyInput);
          if (intInput > 0) {
            state.fromCurrencyInput = (intInput / state.rate()).toStringAsFixed(2);
          } else {
            state.fromCurrencyInput = "";
          }
        } else {
          state.fromCurrencyInput = "";
        }
        emit();
    }
  }

}