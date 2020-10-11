import 'package:flutter/material.dart';

class places extends StatefulWidget {
  @override
  _placesState createState() => _placesState();
}

class _placesState extends State<places> {

  Card buildkey(String t)
  {
    return Card(
      elevation: 0.1,
      color: Colors.white70,
      child: ListTile(
        dense:true,
        title: Center(child: Text("$t",  style: TextStyle(color: Colors.black, fontSize: 16))),
      ),
    );
  }

  var list=["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar",  "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh",
    "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan",
    "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[600], Colors.green[600]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
                child: Text("Locations", style: TextStyle(fontFamily: "Pacifico", fontSize: 40,),),
              ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                for (var i in list)
                  buildkey(i)]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
