import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:english_grammar_app/username.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      routes: {
        '/nextScreen': (context) => UserName(),
      },
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
  void initState() {
    _navigator();
    super.initState();
  }

  void _navigator() async {
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return UserName();
        },
      ));
    });
  }

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
            child: SizedBox(
              // width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 30.0,
                    // fontFamily: 'Canterbury',
                    color: Colors.black),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'English Grammar',
                      speed: Duration(milliseconds: 150),
                      textStyle: TextStyle(
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(2, 2),
                          ),
                        ],
                        color: Colors.red,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            width: 277,
            height: 78,
          ),
          SizedBox(
            child: Image.asset(
              "images/undraw_road_knowled.png",
              alignment: Alignment.center,
              // width: 1,
              // height: 1,
            ),
            height: 12,
            width: 12,
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Version ",
                  style: TextStyle(
                      shadows: [
                        Shadow(color: Colors.black, offset: Offset(0, 1)),
                      ],
                      color: Colors.red,
                      fontSize: 10,
                      fontStyle: FontStyle.italic),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "0.1",
                    style: TextStyle(
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 0, 0, 0),
                              offset: Offset(0, 1)),
                        ],
                        color: Colors.red,
                        fontSize: 6,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            width: 200,
            top: 519,
            left: 50,
          ),
          Positioned(
            child: Text(
              "Code4Fun",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 49, 32, 32),
                        offset: Offset(0, 1)),
                  ],
                  color: Color.fromARGB(255, 46, 46, 46),
                  fontSize: 15,
                  fontStyle: FontStyle.italic),
            ),
            width: 200,
            top: 495,
            left: 90,
          ),
          Positioned(
            child: Text(
              "Let's learn English!",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        color: Color.fromARGB(255, 97, 97, 97),
                        offset: Offset(0, 1)),
                  ],
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                  fontStyle: FontStyle.italic),
            ),
            width: 200,
            top: 472,
            left: 48,
          ),
        ],
      ),
    );
  }
}
