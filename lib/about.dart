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
          style: TextStyle(
              color: Colors.white, fontSize: 30),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: double.infinity,
              height: 250,
              color: Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 55.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 82,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlue,
                          radius: 80,
                          child: Icon(
                            Icons.account_circle,
                            size: 150,
                            color: Color.fromARGB(255, 0, 140, 255),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Lastname",
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "Email",
                            style: TextStyle(fontSize: 20),
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
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(1, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "More information",
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
      ),
    );
  }
}
