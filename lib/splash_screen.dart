import 'package:english_grammar_app/home_screen.dart';
import 'package:english_grammar_app/username.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      // routes: {
      //     '/nextScreen': (context) => UserName(),
      //   },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  // void initState() {
  //   _navigator();
  //   super.initState();
  // }
  // void _navigator()async{
  //   await Future.delayed(Duration(seconds: 3), () {
  //     Navigator.push(context, MaterialPageRoute(builder: (context) {
  //       return HomeScreen();
  //     },));
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/HD-wallpaper-red.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Text(
              'English Grammar',
              style: TextStyle(
                shadows: [
                  Shadow(color: Colors.black, offset: Offset(2, 2)),
                ],
                color: Colors.red,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            width: 250,
            height: 78,
          ),
          Image.asset(
            "images/undraw_road_knowled.png",
            // alignment: Alignment.center,
            width: 0,
            height: 0,
          ),
          Positioned(
            child: Container(

              child: Text(
                "Version 0.1",
                style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black, offset: Offset(0, 1)),
                    ],
                    color: Colors.red,
                    fontSize: 10,
                    fontStyle: FontStyle.italic),
              ),
            ),
            width: 100,
            height: -60,
          ),
        ],
      ),
    );
  }
}
