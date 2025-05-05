import 'package:exchanger/l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/model/currency.dart';

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
    final localization = AppLocalizations.of(context);

    return InkWell(
      onTap: () {
        widget.onTap?.call();
      },
      child: GestureDetector(
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
                  SizedBox(width: 16),
                  Expanded(child: Text(
                    widget.currency.fullName(localization),
                    style: TextStyle(
                        fontSize: 20
                    ),
                  )),
                  SizedBox(width: 16),
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
      )
    );
  }
}