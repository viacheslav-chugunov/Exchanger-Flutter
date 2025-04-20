import 'package:exchanger/core/model/exchange_pair.dart';
import 'package:exchanger/feature/screen/rate/ui/component/currency_input_component.dart';
import 'package:exchanger/feature/screen/rate/ui/screen/rate_action.dart';
import 'package:exchanger/feature/screen/rate/ui/screen/rate_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({super.key});

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  late RateViewModel viewModel;

  @override
  void didChangeDependencies() {
    final exchangePair = ModalRoute.of(context)?.settings.arguments as ExchangePair;
    viewModel = RateViewModel(() => setState(() {}), exchangePair);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      appBar: AppBar(
        title: Text(state.title()),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.handle(RateActionSwapCurrencies());
              },
              icon: const Icon(Icons.swap_vert)
          )
        ],
        automaticallyImplyLeading: false,
        leading: CloseButton(
          onPressed: () {
            Navigator.pop(
                context,
                state.exchangePair
            );
          }
        ),
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
                  hint: state.fromHint(),
                  input: state.fromCurrencyInput,
                  icon: ClipOval(
                    child: SvgPicture.asset(
                      state.fromIconPath(),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onInputChanged: (input) {
                    viewModel.handle(RateActionRecalculateToCurrency(input));
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
                    input: state.toCurrencyInput,
                    hint: state.toHint(),
                    icon: ClipOval(
                      child: SvgPicture.asset(
                          state.toIconPath(),
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover
                      ),
                    ),
                    onInputChanged: (input) {
                      viewModel.handle(RateActionRecalculateFromCurrency(input));
                    },
                  )
              ),
            ),
            Text(
                state.rateString(),
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
