// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  /// statefulwidget: 상태에 따라 가변 데이터 UI 출력 (구조는 widget 그자체와 state를 구성하는 부분으로 나뉨)
  /// statelesswidget: build metod를 통해 단순히 UI 출력
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //int counter = 0;
  List<int> numbers = [];

  void onClick() {
    setState(() {
      //counter = counter + 1;
      numbers.add(numbers.length);
    });
  }

  void onReset() {
    setState(() {});
    //counter = 0;
    numbers = [];
  }

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTitle ? MyLargeTitle() : Text('Nothing'),
              IconButton(
                  onPressed: toggleTitle, icon: Icon(Icons.remove_red_eye)),
/*              Text(
                '$counter',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              for (var n in numbers) Text('$n'),
              IconButton(
                iconSize: 40,
                onPressed: onClick,
                icon: Icon(Icons.add_box_rounded),
              ),
              IconButton(
                onPressed: onReset,
                icon: Icon(Icons.reset_tv_rounded),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  ///init -> dispose : widget life cycle
  @override
  void initState() {
    // 부모 요소의 변수를 초기화 할 때 사용하는 메소드
    // build context 이전에 호출하며 1회만 호출
    super.initState();
    // ignore: avoid_print
    print('initState');
  }

  @override
  void dispose() {
    // widget 제거할 떄 호출 메소드
    super.dispose();
    // ignore: avoid_print
    print('dispose!');
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
