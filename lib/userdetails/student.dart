import 'package:flutter/material.dart';

class getInfo extends StatefulWidget {
  @override
  _getInfoState createState() => _getInfoState();
}

class _getInfoState extends State<getInfo> {

  Card buildkey(String t)
  {
    return Card(
      color: Colors.blue[900],
      child: ListTile(
        dense:true,
        title: Text("$t: ",  style: TextStyle(color: Colors.white70, fontSize: 20)),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange[700],
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 4.0, 150.0, 4.0),
              child: RaisedButton(
                color: Colors.blue[900],
                child: Text("Edit",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    )),
                onPressed: () => print("Pressed"),
              ),
            ),
            RaisedButton(
              color: Colors.blue[900],
              child: Text("Logout",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  )),
              onPressed: () => print("Pressed"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.orange[200],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange[300],
                      borderRadius: BorderRadius.all(Radius.circular(35.0))),
                  height: 170,
                  width: 150,
                ),
                Expanded(
                  child: Container(
                    height: 150,
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text("Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              )),
                        )),
                  ),
                )
              ],
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Age: \n"
                    "Location: \n"
                    "Gender: \n", style: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildkey("About me"),
                  buildkey("Grade"),
                  buildkey("Preferred mode of tutoring"),
                  buildkey("Need help in subjects"),
                  buildkey("Timings"),
                  buildkey("Email ID"),
                  buildkey("Ph number"),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Center(
            child: Text("User Details: ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ))),
        backgroundColor: Colors.orange[300],
        actions: [
          Icon(Icons.person, size: 35, color: Colors.blue[900],),
        ],
      ),
    );
  }
}
