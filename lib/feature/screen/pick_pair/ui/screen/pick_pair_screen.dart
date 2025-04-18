import 'package:exchanger/feature/screen/pick_pair/ui/component/currency_tile_component.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_action.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_state.dart';
import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/model/currency.dart';
import '../../../../../core/model/exchange_pair.dart';
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
    final state = viewModel.state;
    final visibleCurrencies = state.visibleCurrencies();

    _searchController.text = state.searchQuery;

    return Scaffold(
      appBar: AppBar(
        title: Builder(
            builder: (context) {
              if (!state.showSearch) {
                return Text(state.title());
              }
              return TextField(
                controller: _searchController,
                onChanged: (query) {
                  viewModel.handle(PickPairActionSetSearchQuery(query));
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter name of currency"
                ),
                textCapitalization: TextCapitalization.sentences,
                autofocus: true
              );
            }
        ),
        forceMaterialTransparency: true,
        actions: [
          if (state.pairPicked())
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
                          "Failed to load currencies,\ncheck your internet connection\nand try again",
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
                            child: Text("Try again")
                        ),
                        Spacer(flex: 3)
                      ],
                    ),
                  )
              );
            } else {
              return Column(
                children: [
                  state.pairPicked() ? ExchangePairComponent(
                    pair: state.exchangePair,
                    onFromTap: () {
                      viewModel.handle(PickPairActionPickFromCurrency());
                    },
                    onToTap: () {
                      viewModel.handle(PickPairActionPickToCurrency());
                    },
                    pickingFrom: state.pickingCurrency == PickingCurrencyType.from,
                    pickingTo: state.pickingCurrency == PickingCurrencyType.to,
                  ) : Container(),
                  SizedBox(height: state.pairPicked() ? 12 : 0),
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
      floatingActionButton: state.pairPicked() ? FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context,
              "/rate",
              arguments: state.exchangePair
          );
        },
        child: const Icon(Icons.navigate_next),
      ) : null,
    );
  }
}