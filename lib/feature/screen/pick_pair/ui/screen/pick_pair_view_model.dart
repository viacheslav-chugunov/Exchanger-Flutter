import 'package:exchanger/core/base/view_model.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_action.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_state.dart';

import '../../../../../core/repository/currency_network_repository.dart';
import '../../../../network/repository/default_currency_network_repository.dart';
import '../../model/picking_currency_type.dart';

class PickPairViewModel extends ViewModel<PickPairState, PickPairAction> {
  final CurrencyNetworkRepository currencyNetworkRepository = DefaultCurrencyNetworkRepository();

  PickPairViewModel(Function emit) : super(PickPairState(), emit) {
    _loadCurrencies();
  }

  @override
  void handle(PickPairAction action) {
    switch (action) {
      case PickPairActionSwapExchangePairs():
        state.exchangePair = state.exchangePair.swap();
        emit();

      case PickPairActionPickFromCurrency():
        state.pickingCurrency = PickingCurrencyType.from;
        emit();

      case PickPairActionPickToCurrency():
        state.pickingCurrency = PickingCurrencyType.to;
        emit();

      case PickPairActionSelectCurrency():
        switch (state.pickingCurrency) {
          case PickingCurrencyType.from:
            state.exchangePair.fromCurrency = action.currency;
            if (state.pairPicked()) {
              state.pickingCurrency = PickingCurrencyType.none;
            } else {
              state.pickingCurrency = PickingCurrencyType.to;
            }
            emit();
          case PickingCurrencyType.to:
            state.exchangePair.toCurrency = action.currency;
            if (state.pairPicked()) {
              state.pickingCurrency = PickingCurrencyType.none;
            } else {
              state.pickingCurrency = PickingCurrencyType.from;
            }
            emit();
          case PickingCurrencyType.none:
            break;
        }

      case PickPairActionReloadCurrencies():
        state.loadingCurrencies = true;
        state.failedToLoadCurrencies = false;
        emit();
        _loadCurrencies();
    }
  }

  void _loadCurrencies() {
    currencyNetworkRepository.currencies().then((result) {
      if (result.isSuccess) {
        state.currencies = result.data!;
        state.loadingCurrencies = false;
        emit();
      } else if (result.isFailure) {
        state.loadingCurrencies = false;
        state.failedToLoadCurrencies = true;
        emit();
      }
    });
  }

}