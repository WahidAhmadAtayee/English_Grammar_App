import 'package:flutter/material.dart';

var mode = false;
var iconMode = Icons.light_mode;
var fullName = "Full-Name";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    fullName,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              accountEmail: null,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 0, 118, 214),
                  Color.fromARGB(255, 82, 198, 251),
                ]),
              ),
              currentAccountPicture: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 100,
                    child: Image.asset("images/cafetalk.png"),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo,
                        color: Color.fromARGB(255, 2, 98, 143),
                      ),
                    ),
                    right: -5,
                    bottom: -6,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Light/Dark"),
              leading: Icon(iconMode),
              trailing: Switch(
                value: mode,
                onChanged: (v) {
                  if (mode == false) {
                    mode = true;
                    iconMode = Icons.dark_mode;
                  } else {
                    mode = false;
                    iconMode = Icons.light_mode;
                  }
                  setState(() {});
                },
              ),
            ),
            ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
              style: ListTileStyle.drawer,
              // trailing: Drawer,
            ),
            ListTile(
              title: Text("Share App"),
              leading: Icon(Icons.share),
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
            ),
            ListTile(
              title: Text("Exit"),
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            // Image.asset("images/English-Grammar.png"),
            // Image.asset("images/cafetalk.png"),
            // Image.asset("images/undraw_road_knowled.png"),
            Container(
              color: Colors.green,
              width: 250,
              height: 150,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Basic Level"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Intermediate Level"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Advance Level"),
            ),
          ],
        ),
      ),
    );
  }
}
