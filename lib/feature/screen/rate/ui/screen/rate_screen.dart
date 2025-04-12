import 'package:exchanger/core/model/exchange_pair.dart';
import 'package:exchanger/feature/screen/rate/ui/component/currency_input_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  ExchangePair? exchangePair;
  var fromCurrencyInput = "";
  var toCurrencyInput = "";

  @override
  void didChangeDependencies() {
    exchangePair = ModalRoute.of(context)?.settings.arguments as ExchangePair?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final fromIconPath = exchangePair?.fromCurrency?.imagePath ?? "";
    final toIconPath = exchangePair?.toCurrency?.imagePath ?? "";
    final fromHint = exchangePair?.fromCurrency?.fullName;
    final toHint = exchangePair?.toCurrency?.fullName;
    final fromBrief = exchangePair?.fromCurrency?.briefName;
    final toBrief = exchangePair?.toCurrency?.briefName;
    final title = fromBrief != null && toBrief != null ? "$fromBrief / $toBrief" : "";
    final fromRate = exchangePair?.fromCurrency?.rate;
    final toRate = exchangePair?.toCurrency?.rate;
    final rate = fromRate != null && toRate != null ? toRate / fromRate : -1;
    final rateString = rate == -1 ? "" : "1 $fromBrief = ${rate.toStringAsFixed(2)} $toBrief";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  final temp = fromCurrencyInput;
                  fromCurrencyInput = toCurrencyInput;
                  toCurrencyInput = temp;
                  exchangePair = exchangePair?.swap();
                });
              },
              icon: const Icon(Icons.swap_vert)
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 24,
                  right: 16,
                  bottom: 8
                ),
              child: CurrencyInputComponent(
                args: CurrencyInputComponentArgs(
                  hint: fromHint,
                  input: fromCurrencyInput,
                  icon: ClipOval(
                    child: SvgPicture.asset(
                      fromIconPath,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onInputChanged: (input) {
                    fromCurrencyInput = input;
                    if (input.isNotEmpty) {
                      final intInput = int.parse(input);
                      if (intInput > 0) {
                        toCurrencyInput = (intInput * rate).toStringAsFixed(2);
                      } else {
                        toCurrencyInput = "";
                      }
                    } else {
                      toCurrencyInput = "";
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 12
                ),
              child: CurrencyInputComponent(
                  args: CurrencyInputComponentArgs(
                    input: toCurrencyInput,
                    hint: toHint,
                    icon: ClipOval(
                      child: SvgPicture.asset(
                          toIconPath,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover
                      ),
                    ),
                    onInputChanged: (input) {
                      setState(() {
                        toCurrencyInput = input;
                        if (input.isNotEmpty) {
                          final intInput = int.parse(input);
                          if (intInput > 0) {
                            fromCurrencyInput = (intInput / rate).toStringAsFixed(2);
                          } else {
                            fromCurrencyInput = "";
                          }
                        } else {
                          fromCurrencyInput = "";
                        }
                      });
                    },
                  )
              ),
            ),
            Text(
                rateString,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )
            )
          ],
        ),
      ),
    );
  }
}
