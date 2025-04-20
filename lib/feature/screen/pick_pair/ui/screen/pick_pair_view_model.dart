import 'package:exchanger/core/base/view_model.dart';
import 'package:exchanger/core/di/app_graph.dart';
import 'package:exchanger/core/repository/setting_storage_repository.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_action.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_state.dart';

import '../../../../../core/repository/currency_network_repository.dart';
import '../../model/picking_currency_type.dart';

class PickPairViewModel extends ViewModel<PickPairState, PickPairAction> {
  final CurrencyNetworkRepository currencyNetworkRepository = appGraph.inject();
  final SettingStorageRepository settingStorageRepository = appGraph.inject();

  PickPairViewModel(Function emit) : super(PickPairState(), emit) {
    _loadCurrencies();
  }

  @override
  void handle(PickPairAction action) {
    switch (action) {
      case PickPairActionSwapExchangePairs():
        state.exchangePair = state.exchangePair.swap();
        _savePickedPairToCache();
        emit();

      case PickPairActionPickFromCurrency():
        state.pickingCurrency = PickingCurrencyType.from;
        emit();

      case PickPairActionPickToCurrency():
        state.pickingCurrency = PickingCurrencyType.to;
        emit();

      case PickPairActionSelectCurrency():
        final pairWasPicked = state.pairPicked();
        switch (state.pickingCurrency) {
          case PickingCurrencyType.from:
            state.exchangePair.fromCurrency = action.currency;
            if (state.pairPicked()) {
              state.pickingCurrency = PickingCurrencyType.none;
              _savePickedPairToCache();
            } else {
              state.pickingCurrency = PickingCurrencyType.to;
            }
            if (!pairWasPicked) {
              state.showSearch = false;
              state.searchQuery = "";
            }
            emit();
          case PickingCurrencyType.to:
            state.exchangePair.toCurrency = action.currency;
            if (state.pairPicked()) {
              state.pickingCurrency = PickingCurrencyType.none;
              _savePickedPairToCache();
            } else {
              state.pickingCurrency = PickingCurrencyType.from;
            }
            if (!pairWasPicked) {
              state.showSearch = false;
              state.searchQuery = "";
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

      case PickPairActionShowSearch():
        state.showSearch = action.show;
        state.searchQuery = "";
        emit();

      case PickPairActionSetSearchQuery():
        state.searchQuery = action.query;
        emit();

      case PickPairActionSetExchangePair():
        state.exchangePair = action.exchangePair;
        _savePickedPairToCache();
        emit();
    }
  }

  Future<void> _savePickedPairToCache() async {
    final fromCurrency = state.exchangePair.fromCurrency;
    if (fromCurrency != null) {
      await settingStorageRepository.putLatestFromCurrencyBriefName(fromCurrency.briefName);
    }
    final toCurrency = state.exchangePair.toCurrency;
    if (toCurrency != null) {
      await settingStorageRepository.putLatestToCurrencyBriefName(toCurrency.briefName);
    }
  }

  Future<void> _loadCurrencies() async {
    final result = await currencyNetworkRepository.currencies();
    if (result.isSuccess) {
      state.currencies = result.data!;
      state.loadingCurrencies = false;
      await _setLatestPickedPairFromCache();
      emit();
    } else if (result.isFailure) {
      state.loadingCurrencies = false;
      state.failedToLoadCurrencies = true;
      emit();
    }
  }

  Future<void> _setLatestPickedPairFromCache() async {
    final fromCurrency = await settingStorageRepository.getLatestFromCurrencyBriefName();
    final toCurrency = await settingStorageRepository.getLatestToCurrencyBriefName();
    if (fromCurrency != null && toCurrency != null) {
      state.exchangePair.fromCurrency = state.currencies.firstWhere((element) => element.briefName == fromCurrency);
      state.exchangePair.toCurrency = state.currencies.firstWhere((element) => element.briefName == toCurrency);
      state.pickingCurrency = PickingCurrencyType.none;
    } else {
      state.pickingCurrency = PickingCurrencyType.from;
    }
  }

}