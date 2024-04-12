import 'dart:async';
import 'package:flutter/material.dart';
import 'pi_main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => PiApp(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.ease;
        
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeAnimation = animation.drive(tween);

        return FadeTransition(
            opacity: fadeAnimation,
          child: child,
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFCBBCB4),
        body: Center(
          child: Container(
            height: 430,
            width: 430,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/SplashScreenImage.jpg'),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
      ),
    );
  }
}
