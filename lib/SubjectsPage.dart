import 'package:flutter/material.dart';
import 'package:fluttervit_app/tinku%20last%20page/bottom.dart';
import 'package:fluttervit_app/tinku%20last%20page/description.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  double width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Material(
        child: Container(
        decoration: BoxDecoration(
    gradient: LinearGradient(
    colors: [Colors.green[400], Colors.blue[400]],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    ),
        ),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                "Subjects",
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Vocational",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: width * 0.4, // here
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListPageT(
                                                type: "Dance",
                                              ))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSTczPWH0Vp1m1it1iati7UO7MGliFvJA0uGw&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Dance",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListPageT(
                                                type: "Painting",
                                              ))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRo5YdFHr_US-Tsyf5KlC7sT36Z6j69TsJ8uw&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Painting",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListPageT(
                                                type: "Music",
                                              ))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT7SXUSvHmtIki-FMu5_x4fIhPGs2KzIWZnRg&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Music",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT(type: "Cooking"))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Cooking",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Academics",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 180,
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListPageT(
                                                type: "Math",
                                              ))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://image.freepik.com/free-vector/maths-chalkboard_23-2148178220.jpg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Math",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ListPageT(
                                                type: "English",
                                              ))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://cdn1.vectorstock.com/i/thumb-large/98/10/design-concept-of-word-english-website-banner-vector-20429810.jpg",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "English",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT(type: "Biology"))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRk-wXZhI8BHTO_o4VEpUxK2tHrLS1J1xwE4w&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Biology",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT(type: "History"))),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTkyqSdcf5eTQ-BOdTTgJ4fIJXQTAgOAyjwtQ&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "History",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT())),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ1YahFHZyewhPMaNWM0K2yEJzJG1RHJSqqSw&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Physics",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT())),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ86EQKt6atNMT-UUb-B11W9m0trJhmov7caw&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Chemistry",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 200,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT())),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTHEefdY1dCMvFF5kbupj6LIP54inPk2IyOxg&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Geography",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4, // here
                                    height: 150,
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ListPageT())),
                                      child: Card(
                                        child: Stack(
                                          children: <Widget>[
                                            Center(
                                              child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRpm6dS5WnJe12u3n2BhkWxcIkZhgZ-FnrW2Q&usqp=CAU",
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            Text(
                                              "Civics",
                                              style: GoogleFonts.montserrat(
                                                backgroundColor: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ExpansionTile(
                      title: Text(
                        "Other",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}