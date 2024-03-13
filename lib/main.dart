import 'package:flutter/material.dart';
import 'package:move_app/Screens/Loding%20Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LodingScreen(),
    );
  }
}
