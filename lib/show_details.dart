import 'package:english_grammar_app/home_screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class ShowDetails extends StatefulWidget {
  final List<String> definitionList;
  final List<String> exampleList;
  final List<String> quizList;
  final List<String> buttonInfo;
  

  ShowDetails(
      {super.key,
      required this.definitionList,
      required this.exampleList,
      required this.quizList,
      required this.buttonInfo,
      });

  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}

int _value = 0;

class _ShowDetailsState extends State<ShowDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "From page ListOfTitles => Titles",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ));
              },
              icon: Icon(Icons.home))
        ],
      ),
      body: ListView.builder(
        itemCount: widget.definitionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Definition: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.definitionList[index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 2.0,
                    endIndent: 2.0,
                    height: 40.0,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Example: ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.exampleList[index],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 2.0,
                    endIndent: 2.0,
                    height: 40.0,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Quiz: ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.quizList[index],
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 90.0,
                    endIndent: 90.0,
                    height: 80.0,
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {});
                      // use the correct answer of questions to unlock the button
                    },
                    child: Center(
                      child: Text(
                        "Respond",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(4),
                      shadowColor: MaterialStateProperty.all(Colors.black),
                      fixedSize: MaterialStateProperty.all(Size(95, 35)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.blue),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
