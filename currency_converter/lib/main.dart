import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/currency_converter_material_page.dart';
import 'pages/currency_converter_cupertino_page.dart';

void main() {
  runApp(const MyApp());
}

// Types of Widgets
// 1. Stateless
// 2. Stateful
// 3. Inheritedd

// most design systems
// 1. Material design
// 2. Cupertino design : convert from Material design by adding cupertino infront classes

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage()
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp (
      home: CurrencyConvertCupertinoPage(),
    );
  }
}