import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../home.dart';

class addScreen extends StatefulWidget {
  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  Widget Education () {

  Map<String, bool> numbers = {
    'Mtech' : false,
    'Btech' : false,
    'Other' : false,
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
      "Education": FieldValue.arrayUnion(holder_1)
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
              activeColor: Colors.black,
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
  Widget ModeOfTutoring () {

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

  var rating = 3.0;

  RangeValues _currentRangeValues = const RangeValues(4, 6);
  RangeValues _currentRangeValuesForTime = const RangeValues(8, 12);

  TextEditingController aboutMe = TextEditingController();
  TextEditingController timing = TextEditingController();
  TextEditingController mode = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quali = TextEditingController();
  submit(){
    usersRef.doc(currentUser.id).update({
      'bio':aboutMe.text,
      'timing':timing.text,
      'mode of tutoring':mode.text,
      'gender': gender.text,
      'age':age.text,
      'price':price.text,
      'qualification':quali.text
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
      body: SingleChildScrollView(
        child: Padding(
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
              buildkey("About me",aboutMe),
              buildkey("Age(eg: 12)",age),
              buildkey("Location"),
              buildkey("Gender(eg:Male/Female)",gender),
             buildkey("HighestQualification(Mtech/Btech/Others)",quali),
              buildkey("Mode of tutoring(eg. Online/HomeBased)",mode),
              buildkey("PricePerHour(eg: 1200)",price),
              // Container(
              //   height: 80,
              //   width: 270,
              //   decoration: BoxDecoration(
              //       color: Colors.blue[900]
              //   ),
              //   child: Column(
              //     children: [
              //       Text("Ratings",  style: TextStyle(color: Colors.white70, fontSize: 20)),
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 8),
              //         child: SmoothStarRating(
              //           rating: rating,
              //           isReadOnly: false,
              //           size: 35,
              //           filledIconData: Icons.star,
              //           halfFilledIconData: Icons.star_half,
              //           defaultIconData: Icons.star_border,
              //           starCount: 5,
              //           allowHalfRating: true,
              //           spacing: 5.0,
              //           onRated: (value) {
              //             print("rating value -> $value");
              //             // print("rating value dd -> ${value.truncate()}");
              //           },
              //         ),
              //       )
              //     ],
              //   ),
              //
              // ),
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