import '/showcase/pages/showcase.dart' show ShowCaseApp;
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        fontFamily: 'IRANSansXFaNum',
        useMaterial3: true,
      ),
      home:  ShowCaseApp(),
    );
  }
}