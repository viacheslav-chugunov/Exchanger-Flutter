import 'package:exchanger/core/ui/component/currency_tile_component.dart';
import 'package:flutter/material.dart';

import '../../../../../core/model/currency.dart';
import '../../../../../core/model/exchange_pair.dart';
import '../../../../../core/ui/component/exchange_pair_component.dart';

class PickPairScreen extends StatefulWidget {
  const PickPairScreen({super.key});

  @override
  State<PickPairScreen> createState() => _PickPairScreenState();
}

class _PickPairScreenState extends State<PickPairScreen> {
  var _exchangePair = ExchangePair.empty();
  var _pickingCurrency = _PickingCurrencyType.from;

  @override
  Widget build(BuildContext context) {
    String title;
    switch (_pickingCurrency) {
      case _PickingCurrencyType.from:
        title = "Pick first currency";
      case _PickingCurrencyType.to:
        title = "Pick second currency";
      case _PickingCurrencyType.none:
        title = "Pick a pair";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        forceMaterialTransparency: true,
        actions: _exchangePair.isNotEmpty() ? [
          IconButton(
              onPressed: () {
                setState(() {
                  _exchangePair = _exchangePair.swap();
                });
              },
              icon: const Icon(Icons.swap_vert)
          )
        ] : null,
      ),
      body: Column(
        children: [
          ExchangePairComponent(
              pair: _exchangePair,
              onFromTap: () {
                setState(() {
                  _pickingCurrency = _PickingCurrencyType.from;
                });
              },
              onToTap: () {
                setState(() {
                  _pickingCurrency = _PickingCurrencyType.to;
                });
              },
          ),
          SizedBox(height: 12),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var currencies = [
                      Currency.uah(46.93),
                      Currency.rub(96.25),
                      Currency.usd(1.14),
                      Currency.gel(3.13),
                      Currency.eur(1)
                    ];
                    return CurrencyTileComponent(
                      currency: currencies[index],
                      onTap: () {
                        switch (_pickingCurrency) {
                          case _PickingCurrencyType.from:
                            setState(() {
                              _exchangePair.fromCurrency = currencies[index];
                              if (_exchangePair.isNotEmpty()) {
                                _pickingCurrency = _PickingCurrencyType.none;
                              } else {
                                _pickingCurrency = _PickingCurrencyType.to;
                              }
                            });
                          case _PickingCurrencyType.to:
                            setState(() {
                              _exchangePair.toCurrency = currencies[index];
                              if (_exchangePair.isNotEmpty()) {
                                _pickingCurrency = _PickingCurrencyType.none;
                              } else {
                                _pickingCurrency = _PickingCurrencyType.from;
                              }
                            });
                          case _PickingCurrencyType.none:
                            break;
                        }
                      },
                    );
                  }
              )
          )
        ],
      ),
      floatingActionButton: _exchangePair.isNotEmpty() ? FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
              context,
              "/rate",
              arguments: _exchangePair
          );
        },
        child: const Icon(Icons.navigate_next),
      ) : null,
    );
  }
}

enum _PickingCurrencyType { from, to, none }