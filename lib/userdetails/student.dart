import 'package:flutter/material.dart';
import '../home.dart';
import 'edit_student.dart';

class getInfo extends StatefulWidget {
  @override
  _getInfoState createState() => _getInfoState();
}

class _getInfoState extends State<getInfo> {

  logout(){
    googleSignIn.signOut();
    Navigator.pop(context);
  }

  Card buildkey(String t,[String c])
  {
    return Card(
      color: Colors.blue[900],
      child: ListTile(
        dense:true,
        title: Text("$t: ",  style: TextStyle(color: Colors.white70, fontSize: 20)),
        subtitle: Text("$c",style: TextStyle(color: Colors.white70, fontSize: 18) ),
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
                onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=> addScreenS())),
              ),
            ),
            RaisedButton(
              color: Colors.blue[900],
              child: Text("Logout",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  )),
              onPressed:logout,
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
                    image: DecorationImage(
                      image: NetworkImage(currentUser.photoUrl)
                    ),
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
                          child: Text(currentUser.displayName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              )),
                        )),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  buildkey("About me",currentUser.bio),
                  buildkey("Email ID",currentUser.email),
                  buildkey("Age"),
                  buildkey("Location"),
                  buildkey("Gender"),
                  buildkey("Grade"),
                  buildkey("Preferred mode of tutoring"),
                  buildkey("Need help in subjects"),
                  buildkey("Timings"),
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
          IconButton(icon: Icon(Icons.home, size: 35, color: Colors.blue[900],),
            onPressed:()=> print("Put in MyHome Page here"),
          ),
        ],
      ),
    );
  }
}
