import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/model/exchange_pair.dart';

class ExchangePairComponent extends StatelessWidget {
  final ExchangePair? pair;
  final bool pickingFrom;
  final bool pickingTo;
  final Function? onFromTap;
  final Function? onToTap;

  const ExchangePairComponent({super.key, this.pair, this.onFromTap, this.onToTap, required this.pickingFrom, required this.pickingTo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pair = this.pair;
    if (pair == null) return Container();
    final rate = pair.toCurrency.rate / pair.fromCurrency.rate;
    final rateString = "1 : ${rate.toStringAsFixed(2)}";
    final fromImagePath = pair.fromCurrency.imagePath ?? "";
    final toImagePath = pair.toCurrency.imagePath ?? "";
    final fromCurrencyName = pair.fromCurrency.briefName ?? "";
    final toCurrencyName = pair.toCurrency.briefName ?? "";

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                    border: pickingFrom ? Border.all(
                        color: theme.primaryColor.withValues(alpha: 0.5),
                        width: 2
                    ) : null,
                    borderRadius: pickingFrom ? BorderRadius.circular(100) : null,
                    boxShadow: [
                      if (pickingFrom)
                        BoxShadow(
                          color: theme.primaryColor.withValues(alpha: 0.3),
                          spreadRadius: 4,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                    ]
                ),
                child: ClipOval(
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        fromImagePath,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        onFromTap?.call();
                      },
                    )
                ),
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
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  border: pickingTo ? Border.all(
                      color: theme.primaryColor.withValues(alpha: 0.5),
                      width: 2
                  ) : null,
                  borderRadius: pickingTo ? BorderRadius.circular(100) : null,
                  boxShadow: [
                    if (pickingTo)
                      BoxShadow(
                        color: theme.primaryColor.withValues(alpha: 0.3),
                        spreadRadius: 4,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                      ),
                  ]
                ),
                child: ClipOval(
                    child: GestureDetector(
                      child: SvgPicture.asset(
                        toImagePath,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        onToTap?.call();
                      },
                    )
                ),
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