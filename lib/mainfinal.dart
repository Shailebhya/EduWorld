import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/LanguagesPage.dart';
import 'package:fluttervit_app/SubjectsPage.dart';
import 'package:fluttervit_app/home.dart';
import 'package:fluttervit_app/tinku%20last%20page/description.dart';
import 'package:fluttervit_app/userdetails/student.dart';
import 'package:fluttervit_app/userdetails/teacher.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usersRef = FirebaseFirestore.instance.collection('usersRef');

  num hasCat;
  double width , height;
  @override
  void initState() {
    checkCategoryPresent();
    // TODO: implement initState
    super.initState();
  }
  checkCategoryPresent()async{
    DocumentSnapshot doc = await usersRef.doc(currentUser.id).get();
    var cat =doc["category"];
    if(cat=="Teacher"){
      setState(() {
        hasCat=0;
      });
    }
    else if(cat=="Student"){setState(() {
      hasCat=1;
    });}

  }
  @override
  Widget build(BuildContext context) {
width = MediaQuery.of(context).size.width;
height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF485079),
        elevation: 0,
        leading: Container(
            padding: EdgeInsets.symmetric(vertical: 6),child: Image(image: NetworkImage("https://drive.google.com/file/d/1IvKyTvzjDT_iiiKp3dfINygSJOgqYy50/view?usp=sharing"),)),
        title: GestureDetector(child: Text("EduWorld" , style: TextStyle(color: Colors.white),)),
        centerTitle: true,
        actions: <Widget>[
            GestureDetector(
                          child: IconButton(
                
                icon: Image.network(currentUser.photoUrl),
                onPressed:(){
                  checkCategoryPresent();
                  if(hasCat==0)
                 { Navigator.push(context, MaterialPageRoute(builder: (context)=> getInfoT()));}
                  else if(hasCat==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> getInfo()));
                  }

                }
              ),
            )
          ],
      ),
      backgroundColor: Color(0xFF485079),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: 'a',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image(image:NetworkImage("https://drive.google.com/file/d/1GNYNTLnC6_cT-mJ_cedAptj5QWtH9aOM/view?usp=sharing"),
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SubjectsPage())),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Text(
                          ("Subjects"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),

                        ),
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Hero(
                tag: 'b',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.network("https://drive.google.com/file/d/1tlSVXGu0ctjjvzCvEWlb4BfnqUIxAcHj/view?usp=sharing",
                    height: 80,
                    width: 80,

                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Text(
                        ("Location"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),

                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: 'c',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.asset("assets/images/language.png",
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LanguagesPage())),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20),
                        child: Text(
                          ("Language"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),

                        ),
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    // Container(
    //   margin: EdgeInsets.symmetric(
    //     horizontal: 20,
    //     vertical: 5,
    //   ),
    //   height: 125,
    //   child: InkWell(
    //     onTap: null,
    //     child: Stack(
    //       alignment: Alignment.bottomCenter,
    //       children: <Widget>[
    //
    //         Container(
    //           height: 90,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(10),
    //             color: Color(0xFF727CAB),
    //
    //           ),
    //         ),
    //         Positioned(
    //           top: 0,
    //           left: 0,
    //           child: Hero(
    //             tag: 'd',
    //             child: Container(
    //               padding: EdgeInsets.symmetric(horizontal: 20),
    //
    //               child: Image(image:NetworkImage("https://drive.google.com/file/d/1cD3i5iM4ajXnFT1rhv7KJAFeSmYgwz0k/view?usp=sharing"),
    //                 height: 80,
    //                 width: 80,
    //
    //               ),
    //             ),
    //           ),
    //         ),
    //         Positioned(
    //           bottom: 0,
    //           right: 0,
    //           child: SizedBox(
    //             height: 100,
    //             width: width - 200,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: <Widget>[
    //                 Spacer(),
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                       horizontal: 20),
    //                   child: Text(
    //                     ("Mode Of Teaching"), style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
    //
    //                   ),
    //                 ),
    //
    //                 Spacer(),
    //
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // ),
          ],
        ),
      ),
    );
  }
}
