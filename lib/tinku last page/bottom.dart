import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/home.dart';
import 'package:fluttervit_app/tinku%20last%20page/radio.dart';
//import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

Stream<QuerySnapshot> snap ;
class ListPageT extends StatefulWidget {
  String type;
  ListPageT({this.type});

  @override
  _ListPageTState createState() => _ListPageTState();
}

class _ListPageTState extends State<ListPageT> {



buildList(AsyncSnapshot<QuerySnapshot> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data.docs.length,
    itemBuilder: (BuildContext context, int index) {
      DocumentSnapshot doc = snapshot.data.docs[index];

      return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 30),
                      child: Image(
                        height: 100.0,
                        width: 100.0,
                        image: AssetImage('assets/Pali_Lucknow.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 30),
                          child: Text(
                            widget.type,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: Text(
                            '(Beginners)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 5),
                          child: Text(
                            doc['displayName'],
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(Icons.star, color: Colors.grey)
                        ],
                      ),
                    ],
                  ),
                ],
      );
    },
  );
}

void bottomSheet(BuildContext context) {
    showModalBottomSheet( enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (ctx) {
          return ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: NewBottomModel());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Location',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.filter_list,
                size: 30,
              ),
              onPressed: () {
                // Bottom();
                bottomSheet(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 15.0,
              child: Image.network(
                  "https://www.tuktukdesign.com/wp-content/uploads/2017/12/person-icon.jpg",fit: BoxFit.contain),
            ),
          ),
        ],
      ),
      body:StreamBuilder<QuerySnapshot>(
        stream: usersRef.where('subjects' ,arrayContains: widget.type).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      // body: ListView(
      //   children: <Widget>[
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 10.0, top: 30),
      //             child: Image(
      //               height: 100.0,
      //               width: 100.0,
      //               image: AssetImage('assets/Pali_Lucknow.jpg'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 30),
      //                 child: Text(
      //                   'Learn Kathak Online',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   '(Beginners)',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   'Guru Pali Chandra',
      //                   style: TextStyle(color: Colors.grey, fontSize: 18),
      //                 )),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0),
      //                   child: Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(Icons.star, color: Colors.grey)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 10.0, top: 30),
      //             child: Image(
      //               height: 100.0,
      //               width: 100.0,
      //               image: AssetImage('assets/Pali_Lucknow.jpg'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 30),
      //                 child: Text(
      //                   'Learn Kathak Online',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   '(Beginners)',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   'Guru Pali Chandra',
      //                   style: TextStyle(color: Colors.grey, fontSize: 18),
      //                 )),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0),
      //                   child: Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(Icons.star, color: Colors.grey)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 10.0, top: 30),
      //             child: Image(
      //               height: 100.0,
      //               width: 100.0,
      //               image: AssetImage('assets/Pali_Lucknow.jpg'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 30),
      //                 child: Text(
      //                   'Learn Kathak Online',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   '(Beginners)',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   'Guru Pali Chandra',
      //                   style: TextStyle(color: Colors.grey, fontSize: 18),
      //                 )),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0),
      //                   child: Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(Icons.star, color: Colors.grey)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 10.0, top: 30),
      //             child: Image(
      //               height: 100.0,
      //               width: 100.0,
      //               image: AssetImage('assets/Pali_Lucknow.jpg'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 30),
      //                 child: Text(
      //                   'Learn Kathak Online',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   '(Beginners)',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   'Guru Pali Chandra',
      //                   style: TextStyle(color: Colors.grey, fontSize: 18),
      //                 )),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0),
      //                   child: Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(Icons.star, color: Colors.grey)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Align(
      //           alignment: Alignment.topLeft,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 10.0, top: 30),
      //             child: Image(
      //               height: 100.0,
      //               width: 100.0,
      //               image: AssetImage('assets/Pali_Lucknow.jpg'),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 30),
      //                 child: Text(
      //                   'Learn Kathak Online',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   '(Beginners)',
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 18),
      //                 )),
      //             Padding(
      //                 padding: const EdgeInsets.only(left: 10.0, top: 5),
      //                 child: Text(
      //                   'Guru Pali Chandra',
      //                   style: TextStyle(color: Colors.grey, fontSize: 18),
      //                 )),
      //             Row(
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0),
      //                   child: Icon(
      //                     Icons.star,
      //                     color: Colors.yellow,
      //                   ),
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(
      //                   Icons.star,
      //                   color: Colors.yellow,
      //                 ),
      //                 Icon(Icons.star, color: Colors.grey)
      //               ],
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}


class NewBottomModel extends StatefulWidget {
  String type;
  NewBottomModel({this.type});
  @override
  _NewBottomModelState createState() => _NewBottomModelState();
}

class _NewBottomModelState extends State<NewBottomModel> {
  var rating = 3.0;

// SfRangeValues _values = const SfRangeValues(4.0, 6.0);
// SfRangeValues _values1 = SfRangeValues(DateTime(2000, 01, 01, 07, 00, 00), DateTime(2000, 01, 01, 17, 00, 00));
  RangeValues _currentRangeValues = const RangeValues(4, 6);
  RangeValues _currentRangeValuesForTime = const RangeValues(8, 12);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.width * 1.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Qualifications',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              MyStatefulWidget(),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Price',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$0"),
                    Text("\$2"),
                    Text("\$4"),
                    Text("\$6"),
                    Text("\$8"),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Timing',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              RangeSlider(
                values: _currentRangeValuesForTime,
                min: 8,
                max: 19,
                divisions: 10,
                labels: RangeLabels(
                  _currentRangeValuesForTime.start.round().toString(),
                  _currentRangeValuesForTime.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValuesForTime = values;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("8 am"),
                    Text("12 pm"),
                    Text("7pm"),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ratings',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 8),
                child: SmoothStarRating(
                  rating: rating,
                  isReadOnly: false,
                  size: 35,
                  filledIconData: Icons.star,
                  halfFilledIconData: Icons.star_half,
                  defaultIconData: Icons.star_border,
                  starCount: 5,
                  allowHalfRating: true,
                  spacing: 5.0,
                  onRated: (value) {
                    print("rating value -> $value");
                    // print("rating value dd -> ${value.truncate()}");
                  },
                ),
              ),
              RaisedButton(child: Text("Confirm"),
              onPressed: (){
                setState(() {
                  snap=usersRef.where('subjects' ,arrayContains: widget.type).where('price' ,isEqualTo: _currentRangeValues.toString()).snapshots();
                  print(_currentRangeValues);
                });
              },)
            ],
          ),
        ),
      ),
    );
  }
}