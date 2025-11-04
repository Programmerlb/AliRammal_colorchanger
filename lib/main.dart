import 'package:flutter/material.dart';
import 'color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'color changer app',
      home: const ColorChanger(),
    );
  }
}

