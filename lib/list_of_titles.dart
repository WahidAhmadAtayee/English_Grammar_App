import 'package:english_grammar_app/info/info.dart';
import 'package:english_grammar_app/show_details.dart';
import 'package:flutter/material.dart';

class Titles extends StatefulWidget {
  const Titles({
    super.key,
  });

  @override
  State<Titles> createState() => _TitlesState();
}

class _TitlesState extends State<Titles> {
  Info info = Info();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Titles from Home",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  top: 20.0,
                ),
                child: Text(
                  "List of Contacts:",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )),
          Divider(
            height: MediaQuery.of(context).size.height * 0.01,
            thickness: MediaQuery.of(context).size.width * 0.005,
            indent: 15.0,
            endIndent: 15.0,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: info.titleList.length, // Replace with actual item count
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                bool isChecked =
                    false; // Replace with own logic to manage the checkbox state

                return ListTile(
                  leading: Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      // Replace with own logic to handle checkbox changes
                      // Will need to update the isChecked value for each item
                    },
                  ),
                  title: Text(
                    info.titleList[index],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.justify,
                  ),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ShowDetails(
                            definitionList: [info.definitionList[index].toString()],
                            exampleList: [info.exampleList[index]],
                            quizList: [info.quizList[index]],
                            buttonInfo: [info.buttonList[5]],
                           
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}