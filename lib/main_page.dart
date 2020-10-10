import 'package:flutter/material.dart';
import 'package:fluttervit_app/LanguagesPage.dart';
import 'package:fluttervit_app/SubjectsPage.dart';
import 'package:fluttervit_app/home.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(currentUser.photoUrl),
          ),
          RaisedButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SubjectsPage())),
            child: Text("Subjects"),
          ),  RaisedButton(
            onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguagesPage())),
            child: Text("Languages"),
          ),
        ],

      )
    );
  }
}
