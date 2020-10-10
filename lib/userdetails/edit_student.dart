import 'package:flutter/material.dart';
import 'package:fluttervit_app/home.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';

class addScreenS extends StatefulWidget {
  @override
  _addScreenSState createState() => _addScreenSState();
}

class _addScreenSState extends State<addScreenS> {

  RangeValues _currentRangeValues = const RangeValues(4, 6);
  RangeValues _currentRangeValuesForTime = const RangeValues(8, 12);
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

              buildkey("About me",aboutMe),
              buildkey("Grade"),
              buildkey("Preferred mode of tutoring"),
              buildkey("Need help in subjects"),
              Container(
                height: 80,
                width: 270,
                decoration: BoxDecoration(
                    color: Colors.blue[900]
                ),
                child: Column(
                  children: [
                    Text("Price",  style: TextStyle(color: Colors.white70, fontSize: 20)),
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 8,
                      divisions: 4,
                      labels: RangeLabels(
                        _currentRangeValues.start.round().toString(),
                        _currentRangeValues.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                  ],
                ),

              ),
              buildkey("Email ID"),
              buildkey("Ph number"),
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

      ),
    );
  }
}