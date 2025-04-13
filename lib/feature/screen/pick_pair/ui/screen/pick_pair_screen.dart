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
  late PickPairViewModel viewModel;

  @override
  void initState() {
    viewModel = PickPairViewModel(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: Text(state.title()),
        forceMaterialTransparency: true,
        actions: state.pairPicked() ? [
          IconButton(
              onPressed: () {
                viewModel.handle(PickPairActionSwapExchangePairs());
              },
              icon: const Icon(Icons.swap_vert)
          )
        ] : null,
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
                  ) : Container(),
                  SizedBox(height: state.pairPicked() ? 12 : 0),
                  Expanded(
                      child: ListView.builder(
                          itemCount: state.currencies.length,
                          itemBuilder: (context, index) {
                            return CurrencyTileComponent(
                              currency: state.currencies[index],
                              onTap: () {
                                viewModel.handle(PickPairActionSelectCurrency(state.currencies[index]));
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