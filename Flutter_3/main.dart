import 'package:flutter/material.dart';
import 'one_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one' : (context) => OneScreen(),
        '/two' : (context) => TwoScreen(),
      },
    );
  }
}