// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';
// import 'radio.dart';
//
// class MyHomePage2 extends StatefulWidget {
//   @override
//   _MyHomePage2State createState() => _MyHomePage2State();
// }
//
// class _MyHomePage2State extends State<MyHomePage2> {
//   var rating = 3.0;
//
//
//   SfRangeValues _values = const SfRangeValues(4.0, 6.0);
//   SfRangeValues _values1 = SfRangeValues(DateTime(2000, 01, 01, 07, 00, 00), DateTime(2000, 01, 01, 17, 00, 00));
//   void _showModelSheet() {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return Container(
//             height: 1200,
//             decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(20), topRight: Radius.circular(20) )),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: ListView(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Qualifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
//                   ),
//                   MyStatefulWidget(),
//                   Divider(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Price', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
//                   ),
//                   SizedBox(height: 10,),
//                   SfRangeSlider(
//                     min: 0.0,
//                     max: 8.0,
//                     values: _values,
//                     interval: 2,
//                     showTicks: true,
//                     showLabels: true,
//                     numberFormat: NumberFormat("\$"),
//                     onChanged: (SfRangeValues newValues) {
//                       setState(() {
//                         _values = newValues;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10,),
//                   Divider(),
//                   SizedBox(height: 10,),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Timing', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
//                   ),
//                   SizedBox(height: 10,),
//
//                   SfRangeSlider(
//                     min: DateTime(2000, 01, 01, 02, 00, 00),
//                     max: DateTime(2000, 01, 01, 22, 00, 00),
//                     values: _values1,
//                     interval: 5,
//                     showLabels: true,
//                     showTicks: true,
//                     dateFormat: DateFormat('h:mm a'),
//                     dateIntervalType: DateIntervalType.hours,
//                     onChanged: (SfRangeValues newValues) {
//                       setState(() {
//                         _values = newValues;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 10,),
//                   Divider(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Ratings', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),),
//                   ),
//                   SizedBox(height: 10,),
//                   SmoothStarRating(
//                     rating: rating,
//                     isReadOnly: false,
//                     size: 25,
//                     filledIconData: Icons.star,
//                     halfFilledIconData: Icons.star_half,
//                     defaultIconData: Icons.star_border,
//                     starCount: 5,
//                     allowHalfRating: true,
//                     spacing: 2.0,
//                     onRated: (value) {
//                       print("rating value -> $value");
//                       // print("rating value dd -> ${value.truncate()}");
//                     },
//                   )
//
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: <Widget>[
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, top: 30.0 ),
//                 child: Text('Location', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 200.0, top: 20.0 ),
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.filter_list,
//                     size: 30,
//                   ),
//                   onPressed: () {
//                     _showModelSheet();
//                   },
//
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 5.0, top: 30.0),
//                   child: CircleAvatar(
//                     radius: 15.0,
//                     //backgroundImage: AssetImage('assets/beautiful.jpg'),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 10.0, top: 30),
//                   child: Image(
//                     height: 100.0,
//                     width: 100.0,
//                     image: AssetImage('assets/Pali_Lucknow.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 30),
//                       child:Text('Learn Kathak Online', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('(Beginners)', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)),
//                   Padding(
//                       padding: const EdgeInsets.only(left: 10.0, top: 5),
//                       child:Text('Guru Pali Chandra', style: TextStyle(color: Colors.grey, fontSize: 18),)),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: Icon(Icons.star, color: Colors.yellow,),
//                       ),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.yellow,),
//                       Icon(Icons.star, color: Colors.grey )
//                     ],
//                   ),
//
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }