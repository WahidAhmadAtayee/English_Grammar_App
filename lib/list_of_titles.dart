import 'package:flutter/material.dart';

class Titles extends StatefulWidget {
  const Titles({super.key});

  @override
  State<Titles> createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titles"),
      ),
      body: Center(child: Text("ListView.builder()")),
    );
  }
}
