import 'package:flutter/material.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';

import '../home.dart';

class addScreen extends StatefulWidget {
  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {

  TextEditingController aboutMe = TextEditingController();
  submit(){
    usersRef.doc(currentUser.id).update({
      'bio':aboutMe.text
    });
    aboutMe.clear();
    Navigator.pop(context);
  }
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit your details:', style: TextStyle( color: Colors.black),),
        backgroundColor: Colors.amber[200],
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
                  buildkey("About me",aboutMe),
                  buildkey("Education"),
                  buildkey("Mode of tutoring"),
                  buildkey("Price"),
                  buildkey("Rating/Subject Knowledge"),
                  buildkey("Timings"),
                  buildkey("Email ID"),
                  buildkey("Ph number",),
                ],
              ),
            ),
            RaisedButton(
              child: Text("SAVE THE CHANGES"),
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }
  Card buildkey(String t,[TextEditingController controller]) {
    return Card(
      color: Colors.blue[900],
      child: ListTile(
        dense: true,
        title: Text("$t: ",  style: TextStyle(color: Colors.white70, fontSize: 20)),
        // TextField instead of text to take in values
        // controller: myController,
        subtitle: TextField(controller: controller),
      ),
    );
  }
}