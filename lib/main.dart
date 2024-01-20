import 'package:english_grammar_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:english_grammar_app/splash_screen.dart';


void main() {
  runApp( MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mode ? ThemeData.dark() : ThemeData.light(),
        home: SplashScreen(),
      ),

  );
}
 

