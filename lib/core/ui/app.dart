import 'package:exchanger/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../../feature/screen/pick_pair/ui/screen/pick_pair_screen.dart';
import '../../feature/screen/rate/ui/screen/rate_screen.dart';

class ExchangerApp extends StatelessWidget {
  const ExchangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final theme = ExchangerTheme();
    final scheme = isDarkMode ? theme.dark() : theme.light();

    return MaterialApp(
      theme: scheme,
      routes: {
        "/": (context) => const PickPairScreen(),
        "/rate": (context) => const RateScreen()
      },
    );
  }
}