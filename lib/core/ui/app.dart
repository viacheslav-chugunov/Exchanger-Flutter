import 'package:exchanger/core/ui/theme.dart';
import 'package:flutter/material.dart';
import '../../feature/screen/pick_pair/ui/screen/pick_pair_screen.dart';
import '../../feature/screen/rate/ui/screen/rate_screen.dart';

class ExchangerApp extends StatelessWidget {
  const ExchangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: exchangerTheme,
      routes: {
        "/": (context) => const PickPairScreen(),
        "/rate": (context) => const RateScreen()
      },
    );
  }
}