import 'package:english_grammar_app/home_screen.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return HomeScreen();
              },
            ));
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: double.infinity,
            height: 150,
            color: Color.fromARGB(255, 212, 212, 212),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 52,
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 60,
                        child: Icon(
                          Icons.account_circle,
                          size: 100,
                          color: Color.fromARGB(255, 0, 140, 255),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Wahid Ahmad",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            "Atayee",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "--------@gmail.com",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            child: Divider(
              color: Colors.grey,
              thickness: 1,
              indent: 60,
              endIndent: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 60.0,
              right: 60.0,
              top: 20.0,
            ),
            child: Container(
              child: Center(
                child: Text(
                  "More Information!",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
