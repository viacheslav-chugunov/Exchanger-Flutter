import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/exchange_pair.dart';

class ExchangePairComponent extends StatelessWidget {
  final ExchangePair? pair;

  const ExchangePairComponent({super.key, required this.pair});

  @override
  Widget build(BuildContext context) {
    final rate = pair != null ? (pair?.fromCurrency?.rate ?? 0.0) / (pair?.toCurrency?.rate ?? 0.0) : -1;
    final rateString = rate == -1 ? "" : "1 : ${rate.toStringAsFixed(2)}";
    final fromImagePath = pair?.fromCurrency?.imagePath ?? "";
    final toImagePath = pair?.toCurrency?.imagePath ?? "";
    final fromCurrencyName = pair?.fromCurrency?.briefName ?? "";
    final toCurrencyName = pair?.toCurrency?.briefName ?? "";

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Column(
            children: [
              ClipOval(
                child: GestureDetector(
                  child: SvgPicture.asset(
                    fromImagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    debugPrint("fromCurrency tapped");
                  },
                )
              ),
              Padding(padding: const EdgeInsets.only(top: 4)),
              Text(fromCurrencyName),
            ],
          ),
          Spacer(flex: 2),
          Text(
              rateString,
              style: const TextStyle(
                fontSize: 20
              )
          ),
          Spacer(flex: 2),
          Column(
            children: [
              ClipOval(
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      toImagePath,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                    onTap: () {
                      debugPrint("toCurrency tapped");
                    },
                  )
              ),
              Padding(padding: const EdgeInsets.only(top: 4)),
              Text(toCurrencyName),
            ],
          ),
          Spacer(),
        ],
    );
  }

}