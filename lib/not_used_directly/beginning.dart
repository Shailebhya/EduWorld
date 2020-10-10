import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {



  Widget _buildLoginBtn() {
    return Container(
      
      width: width * .6,
      child: RaisedButton(
        
        onPressed: null,
        elevation: 5.0,
        // onPressed: () {
        //   FirebaseAuth.instance
        //       .signInWithEmailAndPassword(email: _email, password: _password)
        //       .then((onValue) {})
        //       .catchError((error) {
        //     debugPrint("Erro is " + error);
        //   });
        // },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF727CAB),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container( width: 40,child: Image.asset("assets/images/google.png")),
          Text("Sign In with Google" , style: TextStyle(color: Colors.white),),
        ],)
      ),
    );
  }


double width , height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
height = MediaQuery.of(context).size.height;
    return Scaffold(
     
      backgroundColor: Color(0xFF485079),
      body: SingleChildScrollView(
              child: Center(child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
            
             Container(
               margin: EdgeInsets.only(top: height * 0.2 ,bottom: height * 0.05),
               child: Text(
                            'EduWorld',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
             ),
            Container(child: Image.asset("assets/images/logo.png"),
            height: height * 0.30,
            ),
         SizedBox(height: 30,),
            _buildLoginBtn(),
          ],),
        ),),
      )
      );
    
  }
}