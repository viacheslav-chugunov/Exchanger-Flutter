import 'package:exchanger/core/model/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyTileComponent extends StatefulWidget {
  final Currency currency;
  final void Function()? onTap;

  const CurrencyTileComponent({super.key, required this.currency, this.onTap});

  @override
  State<CurrencyTileComponent> createState() => _CurrencyTileComponentState();
}

class _CurrencyTileComponentState extends State<CurrencyTileComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12
          ),
          child: Row(
              children: [
                ClipOval(
                  child: SvgPicture.asset(
                    widget.currency.imagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 24),
                Text(
                  widget.currency.fullName,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Spacer(),
                Text(
                  "[${widget.currency.briefName}]",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ]
          ),
      )
    );
  }
}