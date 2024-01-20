import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_grammar_app/info/fonts.dart';
import 'package:english_grammar_app/info/imageList.dart';
import 'package:english_grammar_app/info/info.dart';
import 'package:share/share.dart';
import 'package:english_grammar_app/about.dart';
import 'package:english_grammar_app/list_of_titles.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



var iconMode = Icons.light_mode;
var fullName = "Full-Name";
bool? isDark;
var mode = false;
class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImageList _imageList = ImageList();
  Info info = Info();
  Fonts font = Fonts();
  var _selectedOption = 'Arial';

  bool _isCheckedEnglish = true;
  bool _isCheckedDari = false;

  var version = "0.1";
  


  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _navigateMode();
  }

  

  _navigateMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isDark = prefs.getBool('isDark');

    if (isDark == true ) {
      mode = true;
      iconMode = Icons.mode_night;
    } else {
      mode = false;
      iconMode = Icons.light_mode_sharp;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      drawer: Drawer(
        width: 268.0,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Color.fromARGB(255, 0, 174, 255),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    fullName,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(197, 255, 224, 224),
                    ),
                  ),
                ],
              ),
              accountEmail: null,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 0, 81, 148),
                  Color.fromARGB(255, 100, 206, 255),
                ]),
              ),
              currentAccountPicture: Stack(
                children: [
                  // Show user's photo
                  CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 100.0,
                    child: Center(
                        child: Text(
                      fullName[0],
                      style: TextStyle(fontSize: 45.0),
                    )),
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
              leading: Icon(iconMode),
              title: Text("Light/Dark"),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Switch(
                  
                  value: mode,
                  onChanged: (v) async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    if (mode == false) {
                      await prefs.setBool('isDark', true);
                      mode = true;
                      iconMode = Icons.dark_mode;
                    } else {
                      await prefs.remove('isDark');
                      mode = false;
                      iconMode = Icons.light_mode;
                    }
                    setState(() {});
                  },
                ),
              ),
              minLeadingWidth: 1.0,
            ),
            ExpansionTile(
              tilePadding: EdgeInsets.only(right: 80.0, left: 16.0),
              title: Row(
                children: [
                  Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Text('Settings:'),
                  ),
                ],
              ),
              children: <Widget>[
                ExpansionTile(
                  tilePadding: EdgeInsets.only(right: 80.0, left: 50.0),
                  title: Row(
                    children: [
                      Icon(Icons.language),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text('Language:'),
                      ),
                    ],
                  ),
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsetsGeometry.lerp(
                          EdgeInsets.zero, EdgeInsets.only(left: 80.0), 1.0),
                      leading: Checkbox(
                        value: _isCheckedEnglish,
                        onChanged: (bool? newValue) {
                          setState(() {
                            if (_isCheckedEnglish == false) {
                              _isCheckedEnglish = newValue!;
                              _isCheckedDari = false;
                            } else {
                              _isCheckedEnglish = false;
                              _isCheckedDari = true;
                            }
                          });
                        },
                      ),
                      title: Text('English'),
                      minLeadingWidth: 1.0,
                    ),
                    ListTile(
                      contentPadding: EdgeInsetsGeometry.lerp(
                          EdgeInsets.zero,
                          EdgeInsets.only(
                            left: 80.0,
                          ),
                          1.0),
                      leading: Checkbox(
                        value: _isCheckedDari,
                        onChanged: (_) {
                          setState(() {
                            if (_isCheckedDari == false) {
                              _isCheckedDari = true;
                              _isCheckedEnglish = false;
                            } else {
                              _isCheckedDari = false;
                              _isCheckedEnglish = true;
                            }
                          });
                        },
                      ),
                      title: Text('Dari'),
                      minLeadingWidth: 1.0,
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsetsGeometry.lerp(
                      EdgeInsets.zero, EdgeInsets.only(left: 50, right: 50), 1),
                  leading: Icon(Icons.font_download),
                  title: Text('Font:'),
                  trailing: DropdownButton<String>(
                    value: _selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                    items: <String>[
                      font.fontsList[0],
                      font.fontsList[1],
                      font.fontsList[2],
                      font.fontsList[3],
                      font.fontsList[4],
                      font.fontsList[5],
                      font.fontsList[6],
                      font.fontsList[7],
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  minLeadingWidth: 1.0,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          iconPadding: EdgeInsets.only(right: 1.0),
                          icon: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return HomeScreen();
                                        },
                                      ));
                                    }),
                              ),
                              Icon(
                                Icons.account_circle,
                                size: 100,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          title: Column(
                            children: [
                              TextField(
                                // controller: "از صفحه اسپلش باید گرفت",
                                decoration: InputDecoration(
                                  filled: true,
                                  prefixIcon: Icon(Icons.account_box),
                                  labelText: "New Username",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                                maxLength: 35,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      info.buttonList[3],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(4),
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black),
                                      fixedSize: MaterialStateProperty.all(Size(
                                          90,
                                          16)), // Set the width and height of the button
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      info.buttonList[4],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(4),
                                      shadowColor: MaterialStateProperty.all(
                                          Colors.black),
                                      fixedSize: MaterialStateProperty.all(Size(
                                          90,
                                          16)), // Set the width and height of the button
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          side: BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  contentPadding: EdgeInsetsGeometry.lerp(
                      EdgeInsets.zero, EdgeInsets.only(left: 50), 1),
                  leading: Icon(Icons.account_circle),
                  title: Text('Change Username'),
                  minLeadingWidth: 1.0,
                ),
              ],
            ),
            ListTile(
              onTap: () {
                Share.share("Share the app");
              },
              title: Text("Share App"),
              leading: Icon(Icons.share),
              minLeadingWidth: 1.0,
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return About();
                  },
                ));
              },
              title: Text("About"),
              leading: Icon(Icons.info),
              minLeadingWidth: 1.0,
            ),
            ListTile(
              onTap: () {
                exit(0);
              },
              title: Text("Exit"),
              leading: Icon(Icons.exit_to_app),
              minLeadingWidth: 1.0,
            ),
            Expanded(
              child: Container(
                height: 450,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 3,
                  color: Color.fromRGBO(116, 116, 116, 0.354),
                  height: 0,
                ),
                Container(
                  color: Colors.grey[300],
                  height: 20,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Version ",
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "0.1",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                height: 180,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: _imageList.imageList,
            ),
            AnimatedSmoothIndicator(
              activeIndex: _currentIndex,
              count: _imageList.imageList.length,
              effect: const SwapEffect(
                type: SwapType.yRotation,
                activeDotColor: Colors.blue,
                dotHeight: 8,
                dotWidth: 8,
                spacing: 10,
                dotColor: Colors.grey,
                paintStyle: PaintingStyle.fill,
              ),
            ),
            SizedBox(
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Titles();
                  },
                ));
              },
              child: Text(
                info.buttonList[0],
                style: TextStyle(
                  fontSize: 20.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(
                    Size(200, 45)), // Set the width and height of the button
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Titles();
                  },
                ));
              },
              child: Text(
                info.buttonList[1],
                style: TextStyle(
                  fontSize: 20.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(
                    Size(200, 45)), // Set the width and height of the button
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return Titles();
                //   },
                // ));
              },
              child: Text(
                info.buttonList[2],
                style: TextStyle(
                  fontSize: 20.5,
                  fontStyle: FontStyle.italic,
                ),
              ),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(4),
                shadowColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(
                    Size(200, 45)), // Set the width and height of the button
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
    );
  }
}
