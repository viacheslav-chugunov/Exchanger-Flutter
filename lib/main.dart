import 'package:exchanger/src/core/core.dart';
import 'package:flutter/material.dart';


void main() async {
  await appGraph.init();
  runApp(const ExchangerApp());
}