import 'package:flutter/material.dart';
import 'package:fluttervit_app/home.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  


  Widget _buildButton(String intro) {
    return Container(
      
      width: width * .4,
      child: RaisedButton(
        
        onPressed: null,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF727CAB),
        child: 
            
          Container(child: Text("$intro" , style: TextStyle(color: Colors.white ,fontSize: 18 ),)),
        
      ),
    );
  }

  double width, height;
  logout(){
    googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFF485079),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: height * 0.1, bottom: height * 0.05),
                    child: Image.asset("assets/images/logo.png"),
                    height: height * 0.20,
                  ),
                  Container(
                    //margin: EdgeInsets.only(
                    //    top: height * 0.2, bottom: height * 0.05),
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontFamily: 'OpenSans',
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.05),
                    child: Text(
                      'Edutech company which aims to provied perfect solution to all the teachers in need and help student to find a mentor easily.',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    //margin: EdgeInsets.only(
                    //    top: height * 0.2, bottom: height * 0.05),
                    child: Text(
                      'Continue As :',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _buildButton("Teacher"),
                  SizedBox(
                    height: 5,
                  ),
                  _buildButton("Student"),
                  RaisedButton(
                    child: Text("logOUT"),
                    onPressed: logout,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
