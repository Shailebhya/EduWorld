import 'package:flutter/material.dart';


enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class  MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  BestTutorSite _site = BestTutorSite.javatpoint;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('MTech'),
          leading: Radio(
            value: BestTutorSite.javatpoint,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),

        ListTile(
          title: const Text('BTech'),
          leading: Radio(
            value: BestTutorSite.w3schools,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('others'),
          leading: Radio(
            value: BestTutorSite.tutorialandexample,
            groupValue: _site,
            onChanged: (BestTutorSite value) {
              setState(() {
                _site = value;
              });
            },
          ),
        ),
      ],
    );
  }
}