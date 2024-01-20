import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_grammar_app/home_screen.dart';
import 'package:flutter/material.dart';

class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  TextEditingController u_nameController = TextEditingController();
  String checkedTextFiled = '';
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
                    bottom: -2,
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
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
              Padding(
                padding: const EdgeInsets.only(left: 50.0, bottom: 10.0),
                child: Align(alignment: Alignment.topLeft,child: Text(checkedTextFiled,style: TextStyle(color: Colors.red),)),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() async {
                    final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      if (u_nameController.text != "") {
                        await prefs.setBool('isLoggedIn', true);
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeScreen();
                          },
                        ));
                      }else{
                        checkedTextFiled = "Enter your full-name, please!";
                      }
                  }); 
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
