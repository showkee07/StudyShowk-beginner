import 'package:flutter/material.dart';

class JinieScreen extends StatelessWidget {
  const JinieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 102, 100, 241),
          title: const Text(
            'Jinie builder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Align(
          child: Container(),
        ),
      ),
    );
  }
}
