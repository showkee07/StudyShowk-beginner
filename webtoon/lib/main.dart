import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';

void main() {
  //ApiService().getTodaysToons(); // 실습할때 console 확인용도
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),

      ///home: JinieScreen(),
    );
  }
}
