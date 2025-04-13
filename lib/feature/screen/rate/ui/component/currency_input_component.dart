import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CurrencyInputComponent extends StatefulWidget {
  final CurrencyInputComponentArgs? args;

  const CurrencyInputComponent({super.key, this.args});

  @override
  State<CurrencyInputComponent> createState() => _CurrencyInputComponentState();
}

class CurrencyInputComponentArgs {
  final String input;
  final String? hint;
  final Widget? icon;
  final void Function(String)? onInputChanged;

  const CurrencyInputComponentArgs({
    required this.input,
    this.hint,
    this.icon,
    this.onInputChanged
  });

}

class _CurrencyInputComponentState extends State<CurrencyInputComponent> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;

    _controller.text = widget.args?.input ?? "";

    return TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: args?.hint,
            icon: args?.icon
        ),
        onChanged: (text) {
          args?.onInputChanged?.call(text);
        },
        keyboardType: TextInputType.numberWithOptions(
            decimal: true,
            signed: true
        ),
        controller: _controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"(^\d*\.?\d*)")),
        ]
    );
  }
}