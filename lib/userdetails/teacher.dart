import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/userdetails/editteacher.dart';
import '../home.dart';

class getInfoT extends StatefulWidget {
  @override
  _getInfoTState createState() => _getInfoTState();
}

class _getInfoTState extends State<getInfoT> {
  logout(){
    googleSignIn.signOut();
    Navigator.pop(context);
  }
  DocumentSnapshot doc ;
  getDetails()async{
    doc = await usersRef.doc(currentUser.id).get();
  }

  Card buildkey(String t,[String c])
  {
    return Card(
      color: Colors.white,
      child: ListTile(
        dense:true,
        title: Text("$t:",  style: TextStyle(color: Colors.black, fontSize: 16)),
      subtitle: Text("$c",style: TextStyle(color: Colors.black, fontSize: 18) ),
      ),
    );
  }
  @override

  Widget build(BuildContext context) {
    getDetails();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400], Colors.green[400]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          //color: Colors.orange[200],
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 2.0, 12.0, 4.0),
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text("Edit",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      )),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>addScreen())),
                ),
              ),
              SizedBox(width: 180,),
              RaisedButton(
                color: Colors.blue[900],
                child: Text("Log Out",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    )),
                onPressed: logout,
              )
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
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
                        gradient: LinearGradient(
                          colors: [Colors.green[400], Colors.blue[400]],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(35.0))),
                    height: 130,
                    width: 140,
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(currentUser.displayName,
                                style: TextStyle( fontFamily: "DancingScript",
                                  color: Colors.black,
                                  fontSize: 40,
                                )),
                          )),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    buildkey("About me", currentUser.bio),
                    buildkey("Email ID", currentUser.email),
                    buildkey("Education"),
                    buildkey("Age"),
                    buildkey("Location"),
                    buildkey("Gender"),
                    buildkey("Mode of tutoring"),
                    buildkey("Price"),
                    buildkey("Timings"),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("User Profile ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              )),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(icon: Icon(Icons.home, size: 35, color: Colors.blue[900],),
            onPressed:()=> print("Put in MyHome Page here"),
            ),
          ],
        ),
      ),
    );
  }
}
