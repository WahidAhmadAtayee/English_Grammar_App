import 'package:flutter/material.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({super.key});

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("From page ListOfTitles => Titles"),
      ),
      body: Center(child: Text("All Informations")),
    );
  }
}
