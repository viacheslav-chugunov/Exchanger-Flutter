import 'package:exchanger/src/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../l10n/gen_l10n/app_localizations.dart';
import '../../feature/screen/pick_pair/ui/screen/pick_pair_screen.dart';
import '../../feature/screen/rate/ui/screen/rate_screen.dart';
import '../base/navigation_service.dart';
import '../core.dart';

class ExchangerApp extends StatefulWidget {

  const ExchangerApp({super.key});

  @override
  State<ExchangerApp> createState() => _ExchangerAppState();
}

class _ExchangerAppState extends State<ExchangerApp> {

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
        "/rate": (context) => const RateScreen(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: NavigationService.navigatorKey,
    );
  }
}