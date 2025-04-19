import 'package:exchanger/feature/screen/pick_pair/ui/screen/pick_pair_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/di/app_graph.dart';
import 'core/ui/app.dart';

void main() async {
  await appGraph.init();
  runApp(const ExchangerApp());
}