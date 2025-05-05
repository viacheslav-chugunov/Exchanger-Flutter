import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:exchanger/src/feature/screen/pick_pair/ui/screen/pick_pair_action.dart';
import 'package:exchanger/src/feature/screen/pick_pair/ui/screen/pick_pair_view_model.dart';
import 'package:flutter/material.dart';
import 'package:exchanger/src/core/core.dart';
import '../component/currency_tile_component.dart';
import '../component/exchange_pair_component.dart';
import '../../model/picking_currency_type.dart';

class PickPairScreen extends StatefulWidget {
  const PickPairScreen({super.key});

  @override
  State<PickPairScreen> createState() => _PickPairScreenState();
}

class _PickPairScreenState extends State<PickPairScreen> {
  final _searchController = TextEditingController();
  late PickPairViewModel viewModel;

  @override
  void initState() {
    viewModel = PickPairViewModel(() {setState(() {});});
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final state = viewModel.state;
    final visibleCurrencies = state.visibleCurrencies(localization);

    _searchController.text = state.searchQuery;

    return Scaffold(
      appBar: AppBar(
        title: Builder(
            builder: (context) {
              if (!state.showSearch) {
                return Text(state.title(localization));
              }
              return TextField(
                controller: _searchController,
                onChanged: (query) {
                  viewModel.handle(PickPairActionSetSearchQuery(query));
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: localization.enterNameOfCurrency
                ),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              );
            }
        ),
        forceMaterialTransparency: true,
        actions: [
          IconButton(
              onPressed: () {
                viewModel.handle(PickPairActionSwapExchangePairs());
              },
              icon: const Icon(Icons.swap_vert)
          ),
          if (!state.showSearch)
            IconButton(
                onPressed: () {
                  viewModel.handle(PickPairActionShowSearch(true));
                },
                icon: const Icon(Icons.search)
            ),
          if (state.showSearch)
            IconButton(
                onPressed: () {
                  viewModel.handle(PickPairActionShowSearch(false));
                },
                icon: const Icon(Icons.close)
            )
        ],
      ),
      body: Builder(
          builder: (context) {
            if (state.loadingCurrencies) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.failedToLoadCurrencies) {
              return SafeArea(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Spacer(flex: 2),
                        Text(
                          localization.failedToLoadCurrenciesErrorMessage,
                          style: TextStyle(
                              fontSize: 20
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        TextButton(
                            onPressed: () {
                              viewModel.handle(PickPairActionReloadCurrencies());
                            },
                            child: Text(localization.tryAgain)
                        ),
                        Spacer(flex: 3)
                      ],
                    ),
                  )
              );
            } else {
              return Column(
                children: [
                  SizedBox(height: 12),
                  ExchangePairComponent(
                    pair: state.exchangePair,
                    onFromTap: () {
                      viewModel.handle(PickPairActionPickFromCurrency());
                    },
                    onToTap: () {
                      viewModel.handle(PickPairActionPickToCurrency());
                    },
                    pickingFrom: state.pickingCurrency == PickingCurrencyType.from,
                    pickingTo: state.pickingCurrency == PickingCurrencyType.to,
                  ),
                  SizedBox(height: 12),
                  Expanded(
                      child: ListView.builder(
                          itemCount: visibleCurrencies.length,
                          itemBuilder: (context, index) {
                            return CurrencyTileComponent(
                              currency: visibleCurrencies[index],
                              onTap: () {
                                viewModel.handle(PickPairActionSelectCurrency(visibleCurrencies[index]));
                              },
                            );
                          }
                      )
                  )
                ]
              );
            }
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(
              context,
              "/rate",
              arguments: state.exchangePair
          ).then((result) {
            if (result is ExchangePair) {
              viewModel.handle(PickPairActionSetExchangePair(result));
            }
          });
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}