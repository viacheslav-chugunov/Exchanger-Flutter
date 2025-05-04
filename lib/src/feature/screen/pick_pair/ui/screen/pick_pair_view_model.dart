import 'package:exchanger/src/core/core.dart';
import 'package:exchanger/src/feature/screen/pick_pair/ui/screen/pick_pair_action.dart';
import 'package:exchanger/src/feature/screen/pick_pair/ui/screen/pick_pair_state.dart';
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
        final pair = state.exchangePair;
        if (pair == null) return;
        state.exchangePair = pair.swap();
        _savePickedPairToCache();
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
            state.exchangePair?.fromCurrency = action.currency;
            state.pickingCurrency = PickingCurrencyType.none;
            _savePickedPairToCache();
            emit();
          case PickingCurrencyType.to:
            state.exchangePair?.toCurrency = action.currency;
            state.pickingCurrency = PickingCurrencyType.none;
            _savePickedPairToCache();
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
    final pair = state.exchangePair;
    if (pair == null) return;
    await settingStorageRepository.putLatestFromCurrencyBriefName(pair.fromCurrency.briefName);
    await settingStorageRepository.putLatestToCurrencyBriefName(pair.toCurrency.briefName);
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
      final firstCurrency = state.currencies.firstWhere((e) => e.briefName == fromCurrency);
      final lastCurrency = state.currencies.firstWhere((e) => e.briefName == toCurrency);
      state.exchangePair = ExchangePair(firstCurrency, lastCurrency);
    } else {
      final usdCurrency = state.currencies.firstWhere((c) => c.briefName == "USD");
      final eurCurrency = state.currencies.firstWhere((c) => c.briefName == "EUR");
      state.exchangePair = ExchangePair(usdCurrency,  eurCurrency);
    }
  }

}