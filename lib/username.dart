import 'package:flutter/material.dart';


class UserName extends StatefulWidget {
  const UserName({super.key});

  @override
  State<UserName> createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(alignment: Alignment.center,
                children: [CircleAvatar(backgroundColor: Colors.grey,radius: 200,),
              Positioned(child: TextButton(onPressed: (){}, child: Icon(Icons.add_a_photo, size: 40,)),right: 40,bottom: 20,)
            ]),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 100.0, left: 100.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: "First-name",),),
            ),
            SizedBox(height: 25,),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, right: 100.0, left: 100.0),
              child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: "Last-name",),),
            ),
            MaterialButton(onPressed: (){},child: Text("Save"),),
          ],
        ),
      ),
    );
  }
}
