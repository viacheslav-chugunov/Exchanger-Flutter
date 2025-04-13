import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/model/exchange_pair.dart';

class ExchangePairComponent extends StatefulWidget {
  ExchangePair? pair;
  Function? onFromTap;
  Function? onToTap;


  ExchangePairComponent({super.key, this.pair, this.onFromTap, this.onToTap});

  @override
  State<ExchangePairComponent> createState() => _ExchangePairComponentState();
}

class _ExchangePairComponentState extends State<ExchangePairComponent> {
  @override
  Widget build(BuildContext context) {
    final pair = widget.pair;
    final rate = pair != null && pair.isNotEmpty() ? (pair.toCurrency!.rate) / (pair.fromCurrency!.rate) : -1;
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
                    widget.onFromTap?.call();
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
                      widget.onToTap?.call();
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