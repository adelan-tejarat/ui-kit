import '/showcase/pages/showcase.dart' show ShowCaseApp;
import 'package:flutter/material.dart';
import 'package:vamstreet_uikit/src/core/themes/typography.dart' show AppTypography;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamstreet Components',
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(textTheme: AppTypography.textTheme),
      home:   ShowCaseApp(),
    );
  }
}
