import 'package:flutter/material.dart';
import 'package:youppie/presentation/screens/home/vets_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youppie',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: VetScreen(),
    );
  }
}
