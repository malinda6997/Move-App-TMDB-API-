import 'dart:async';

import 'package:flutter/material.dart';
import 'package:move_app/Screens/homePage.dart';

class LodingScreen extends StatefulWidget {
  const LodingScreen({super.key});

  @override
  State<LodingScreen> createState() => _LodingScreenState();
}

class _LodingScreenState extends State<LodingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => homePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 300),
          //   child: Text(
          //     "Developed by @Malinda Prabath",
          //     style: TextStyle(color: Colors.grey.shade600),
          //   ),
          // ),
        ],
      ),
    );
  }
}
