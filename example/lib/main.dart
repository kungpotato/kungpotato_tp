import 'package:flutter/material.dart';
import 'package:kungpotato/kungpotato.dart';
import 'package:kungpotato/template.dart';

void main() {
  KpColorSeed.instance.primary = const Color(0xff4ebe65);
  KpColorSeed.instance.secondary = const Color(0xffe073ca);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.lightTheme,
      home: const Template(),
    );
  }
}
