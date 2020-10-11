import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/LanguagesPage.dart';
import 'package:fluttervit_app/Locations.dart';
import 'package:fluttervit_app/SubjectsPage.dart';
import 'package:fluttervit_app/home.dart';
import 'package:fluttervit_app/userdetails/student.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usersRef = FirebaseFirestore.instance.collection('usersRef');

  num hasCat;
  double width, height;

  @override
  void initState() {
    checkCategoryPresent();
    // TODO: implement initState
    super.initState();
  }

  checkCategoryPresent() async {
    DocumentSnapshot doc = await usersRef.doc(currentUser.id).get();
    var cat = doc["category"];
    if (cat == "Teacher") {
      setState(() {
        hasCat = 0;
      });
    } else if (cat == "Student") {
      setState(() {
        hasCat = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400], Colors.green[400]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Image.asset("assets/images/logo.png")),
          title: GestureDetector(
              child: Text(
                "EduWorld",
                style: TextStyle(color: Colors.white70,
                  fontFamily: ('DavidLibre'),
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,),
              )),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: IconButton(
                iconSize: 50,
                  icon: CircleAvatar(
                   child: ClipOval(
                    child: Image.network(currentUser.photoUrl),
                  ),),
                  onPressed: () {
                    checkCategoryPresent();
                    if (hasCat == 0) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => getInfoT()));
                    } else if (hasCat == 1) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => getInfo()));
                    }
                  }),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  height: 125,
                  child: InkWell(
                    onTap: null,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Hero(
                            tag: 'a',
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(
                                "assets/images/book.png",
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            height: 100,
                            width: width - 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubjectsPage())),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      ("Subjects"),
                                      style: TextStyle(
                                          fontSize: 35, fontFamily: ("YanoneKaffeesatz"), color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  height: 125,
                  child: InkWell(
                    onTap: null,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Hero(
                            tag: 'b',
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(
                                "assets/images/location.png",
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: SizedBox(
                            height: 100,
                            width: width - 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(),
                                 GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => places())),
                              child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                                  child: Text(
                                    ("Location"),
                                    style: TextStyle(
                                        fontSize: 35, fontFamily: ("YanoneKaffeesatz"), color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                 ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  height: 125,
                  child: InkWell(
                    onTap: null,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white70,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Hero(
                            tag: 'c',
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Image.asset(
                                "assets/images/language.png",
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            height: 100,
                            width: width - 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LanguagesPage())),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      ("Language"),
                                      style: TextStyle(
                                          fontSize: 35, fontFamily: ("YanoneKaffeesatz"), color: Colors.black, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(
                //     horizontal: 20,
                //     vertical: 5,
                //   ),
                //   height: 125,
                //   child: InkWell(
                //     onTap: null,
                //     child: Stack(
                //       alignment: Alignment.bottomCenter,
                //       children: <Widget>[
                //
                //         Container(
                //           height: 90,
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: Color(0xFF727CAB),
                //
                //           ),
                //         ),
                //         Positioned(
                //           top: 0,
                //           left: 0,
                //           child: Hero(
                //             tag: 'd',
                //             child: Container(
                //               padding: EdgeInsets.symmetric(horizontal: 20),
                //
                //               child: Image.asset("assets/images/teacher.png",
                //                 height: 80,
                //                 width: 80,
                //
                //               ),
                //             ),
                //           ),
                //         ),
                //         Positioned(
                //           bottom: 0,
                //           right: 0,
                //           child: SizedBox(
                //             height: 100,
                //             width: width - 200,
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: <Widget>[
                //                 Spacer(),
                //                 Padding(
                //                   padding: const EdgeInsets.symmetric(
                //                       horizontal: 20),
                //                   child: Text(
                //                     ("Mode Of Teaching"), style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
                //
                //                   ),
                //                 ),
                //
                //                 Spacer(),
                //
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      
    );
  }
}