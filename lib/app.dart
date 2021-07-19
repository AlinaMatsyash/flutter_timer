import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/timer/bloc/timer_bloc.dart';
import 'timer/timer.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 234, 255, 1),
        backgroundColor: Color(0xffdff0fd),
        //brightness: Brightness.light,
      ),
      title: 'Flutter Timer',
      home: const TimerPage(),
    );
  }
}
