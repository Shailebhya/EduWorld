import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/home.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';

class addScreenS extends StatefulWidget {
  @override
  _addScreenSState createState() => _addScreenSState();
}

class _addScreenSState extends State<addScreenS> {
  Widget PreferredModeOfTutoring () {

    Map<String, bool> numbers = {
      'Online' : false,
      'HomeTutor' : false,
    };

    var holder_1 = [];

    getItems(){

      numbers.forEach((key, value) {
        if(value == true)
        {
          holder_1.add(key);
        }
      });

      // Printing all selected items on Terminal screen.
      print(holder_1);
      usersRef.doc(currentUser.id).update({
        "ModeOfTutoring": FieldValue.arrayUnion(holder_1)
      });
      // Here you will get all your selected Checkbox items.

      // Clear array after use.
    }

    return Column (children: <Widget>[

      RaisedButton(
        child: Text(" Get Checked Checkbox Items ", style: TextStyle(fontSize: 20),),
        onPressed: getItems,
        color: Colors.green,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child :
        ListView(
          children: numbers.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: numbers[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  numbers[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),]);

  }
  Widget Subjects () {

    Map<String, bool> numbers = {
      'Dance' : false,
      'Music' : false,
      'Painting' : false,
      'Cooking' : false,
      'Math' : false,
      'Physics' : false,
      'English' : false,
      'Chemistry' : false,
      'Biology' : false,
      'Geography' : false,
      'History' : false,
      'Civics' : false,
    };

    var holder_1 = [];

    getItems(){

      numbers.forEach((key, value) {
        if(value == true)
        {
          holder_1.add(key);
        }
      });

      // Printing all selected items on Terminal screen.
      print(holder_1);
      usersRef.doc(currentUser.id).update({
        "Subjects": FieldValue.arrayUnion(holder_1)
      });
    }

    return Column (children: <Widget>[

      RaisedButton(
        child: Text(" Get Checked Checkbox Items ", style: TextStyle(fontSize: 20),),
        onPressed: getItems,
        color: Colors.green,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child :
        ListView(
          children: numbers.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: numbers[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  numbers[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),]);

  }
  Widget Education () {

    Map<String, bool> numbers = {
      'One' : false,
      'Two' : false,
      'Three' : false,
      'Four' : false,
      'Five' : false,
      'Six' : false,
      'Seven' : false,
    };

    var holder_1 = [];

    getItems(){

      numbers.forEach((key, value) {
        if(value == true)
        {
          holder_1.add(key);
        }
      });

      // Printing all selected items on Terminal screen.
      print(holder_1);
      // Here you will get all your selected Checkbox items.

      // Clear array after use.
      holder_1.clear();
    }

    return Column (children: <Widget>[

      RaisedButton(
        child: Text(" Get Checked Checkbox Items ", style: TextStyle(fontSize: 20),),
        onPressed: getItems,
        color: Colors.green,
        textColor: Colors.white,
        splashColor: Colors.grey,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),

      Expanded(
        child :
        ListView(
          children: numbers.keys.map((String key) {
            return new CheckboxListTile(
              title: new Text(key),
              value: numbers[key],
              activeColor: Colors.pink,
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  numbers[key] = value;
                });
              },
            );
          }).toList(),
        ),
      ),]);

  }

  RangeValues _currentRangeValues = const RangeValues(4, 6);
  RangeValues _currentRangeValuesForTime = const RangeValues(8, 12);
  TextEditingController aboutMe = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController timing = TextEditingController();

  TextEditingController grade = TextEditingController();
  TextEditingController mode = TextEditingController();

  submit(){
    usersRef.doc(currentUser.id).update({
      'bio':aboutMe.text,
      'gender': gender.text,
      'age':age.text,
      'grade':grade.text,
      'mode':mode.text,
      'timing':timing.text
    });
    aboutMe.clear();
    Navigator.pop(context);
  }

  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400], Colors.green[400]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 0.7],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(title: Text('Edit your details:', style: TextStyle( color: Colors.black),),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[400], Colors.green[400]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 0.7],
                          ),
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
                                  style: TextStyle( fontFamily: "DancingScript",
                                    color: Colors.black,
                                    fontSize: 40,
                                  )),
                            )),
                      ),
                    )
                  ],
                ),


                buildkey("About me",aboutMe),
                buildkey("Age(eg: 12)",age),
                buildkey("Location"),
                buildkey("Gender(eg:Male/Female)",gender),
                buildkey("Grade(5-12)(eg:7)",grade),
                buildkey("Mode of tutoring(eg. Online/HomeBased)",mode),
                buildkey("Need help in subjects"),
                buildkey("Timings(eg:3-5 / 14-17)",timing),
                Container(

                  width: 100,
                  child: RaisedButton(

                      onPressed: submit,
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Colors.white,
                      child: Text("Save")
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Card buildkey(String t,[TextEditingController controller]) {
    return Card(
      color: Colors.white70,
      child: ListTile(
        dense: true,
        title: Text("$t: ",  style: TextStyle(color: Colors.black, fontSize: 20)),
        // TextField instead of text to take in values
        // controller: myController,
      ),
    );
  }
}