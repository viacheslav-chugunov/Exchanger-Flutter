import 'package:exchanger/core/ui/component/currency_tile_component.dart';
import 'package:flutter/material.dart';

import '../../../../core/model/currency.dart';
import '../../../../core/model/exchange_pair.dart';
import '../../../../core/ui/component/exchange_pair_component.dart';

class PickPairScreen extends StatelessWidget {
  const PickPairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick a pair')
      ),
      body: Column(
        children: [
          ExchangePairComponent(
              pair: ExchangePair(
                  Currency.gel(3.13),
                  Currency.usd(1.14)
            )
          ),
          SizedBox(height: 12),
          Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    var currencies = [
                      Currency.uah(1),
                      Currency.rub(1),
                      Currency.usd(1),
                      Currency.gel(1),
                    ];
                    return CurrencyTileComponent(
                      currency: currencies[index],
                    );
                  }
              )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: const Icon(
              Icons.done
          ),
      ),
    );
  }

}