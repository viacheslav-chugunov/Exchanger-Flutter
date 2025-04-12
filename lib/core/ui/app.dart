import 'package:exchanger/core/ui/theme.dart';
import 'package:flutter/material.dart';
import '../../feature/screen/pick_pair/ui/pick_pair_screen.dart';

class ExchangerApp extends StatelessWidget {
  const ExchangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: exchangerTheme,
      routes: {
        "/": (context) => const PickPairScreen()
      },
    );
  }
}