import 'package:exchanger/core/model/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CurrencyTileComponent extends StatelessWidget {
  final Currency currency;

  const CurrencyTileComponent({super.key, required this.currency});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Currency tapped");
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
                    currency.imagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 24),
                Text(
                  currency.fullName,
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                Spacer(),
                Text(
                  "[${currency.briefName}]",
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