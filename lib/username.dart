import 'package:english_grammar_app/home_screen.dart';
import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController u_nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 100,
                    child: Image.asset(""),
                  ),
                  Positioned(
                    child: TextButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.add_a_photo,
                        size: 40,
                      ),
                    ),
                    right: 10,
                    bottom: -10,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                  bottom: 15.0,
                  right: 50.0,
                  left: 50.0,
                ),
                child: TextField(
                  controller: u_nameController,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  maxLength: 35,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box),
                    border: OutlineInputBorder(),
                    labelText: "Full-Name",
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ),);
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(4),
                  shadowColor: MaterialStateProperty.all(Colors.black),
                  fixedSize: MaterialStateProperty.all(
                      Size(200, 45),), // Set the width and height of the button
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
