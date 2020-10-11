import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/mainfinal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'models/user.dart';

final usersRef = FirebaseFirestore.instance.collection('usersRef');
final GoogleSignIn googleSignIn =GoogleSignIn();
final timestamp = DateTime.now();
User currentUser;
class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  bool isAuth = false;
  bool hasCat=false;
  final usersRef = FirebaseFirestore.instance.collection('usersRef');

  @override
  void initState(){
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
     handleSignIn(account);
    },
      onError: (err){
      print('Error signing in : $err');
      }
    );

    //Re-authenticate when the app is opened!
    googleSignIn.signInSilently(suppressErrors: false)
    .then((account){
      handleSignIn(account);

    }).catchError((err){
      print('Error signing in : $err');
    });
    checkCategoryPresent();
  }
  handleSignIn(GoogleSignInAccount account)async{
    if(account!= null) {
      //print('User Signed in!:$account');
      await createUserInFirestore();
      setState(() {
        isAuth =true;
      });
    }
    else{
      setState(() {
        isAuth = false;
      },
      );
    }
  }
createUserInFirestore()async {
  //Check if user already exists in users collection in database according to their ID
  final GoogleSignInAccount user = googleSignIn.currentUser;
   DocumentSnapshot doc =await usersRef.doc(user.id).get();

    if(!doc.exists){
      // If the user doesn't exist then we take them to create an account page
     //Get username from create account and use it to make new user document in users collection

      usersRef.doc(user.id).set({
    "id": user.id,
    "photoUrl":user.photoUrl,
    "email": user.email,
    'displayName': user.displayName,
    "bio":"",
    "timestamp":timestamp,
    "category": null
  });
  }
    currentUser = User.fromDocument(doc);
    print(currentUser);

}
  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }

checkCategoryPresent()async{
  DocumentSnapshot doc = await usersRef.doc(currentUser.id).get();
  var cat =doc["category"];
  if(cat!=null){
    setState(() {
      hasCat=true;
    });
    }
  else{setState(() {
    hasCat=false;
  });}

}
//Home screen
  Widget buildAuthScreen() {
    checkCategoryPresent();
   if(hasCat==false){
     //Home page
     return Container(
       decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[400], Colors.green[400]],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
       child: Scaffold(
         key: _scaffoldKey,
         backgroundColor: Colors.transparent,
         body: SingleChildScrollView(
           child: Center(
             child: Expanded(
               child: Column(
                 children: [
                   Container(
                     margin: EdgeInsets.only(
                         top: height * 0.1, bottom: height * 0.05),
                     child: Image.asset("assets/images/logo.png"),
                     height: height * 0.20,
                   ),
                   Container(
                     child: Text(
                       'About Us:',
                       style: TextStyle(
                         color: Colors.black,
                         fontFamily: ('OpenSans'),
                         fontSize: 35.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.symmetric(
                         vertical: height * 0.02, horizontal: width * 0.05),
                     child: Text(
                       'We aim to provided the perfect solution to all the teachers and students on the lookout for their right educational match and help them connect together to build a brighter future for the world! ',
                       style: TextStyle(
                         color: Colors.grey[900],
                         fontFamily: 'OpenSans',
                         fontSize: 20.0,
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                   SizedBox(
                     height: 15,
                   ),
                   Container(
                     //margin: EdgeInsets.only(
                     //    top: height * 0.2, bottom: height * 0.05),
                     child: Text(
                       'Continue As :',
                       style: TextStyle(
                         color: Colors.black,
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
                   SizedBox(height: 5,),
                   Text("(This cant be changed later)" , style: TextStyle(color: Colors.black54),),
                   RaisedButton(
                     child: Text("LOG OUT" , style: TextStyle(color: Colors.white),),
                     onPressed: logout,
                     elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.black.withOpacity(0.9),
                   )
                 ],
               ),
             ),
           ),
         )),
     );}
   else return MyHomePage();
  }

  Widget _buildButton(String intro)
  {
    return Container(
      
      width: width * .4,
      child: RaisedButton(
        onPressed: ()
        {
          usersRef.doc(currentUser.id).update({'category':intro});
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
        },
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white.withOpacity(0.5),
        child: Container(child: Text("$intro" , style: TextStyle(color: Colors.black ,fontSize: 18 ),)),
      ),
    );
  }

  //Sign in with Google button
  Widget _buildLoginBtn() {
    return Container(
      width: width* .7,
      child: RaisedButton(
          onPressed: login,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color:Colors.white70, //.withOpacity(0.6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(width: 50,child: Image.asset("assets/images/google.png")),
              Text("Sign In with Google", style: TextStyle(color: Colors.black, fontSize: 18),),
            ],)
      ),
    );
  }


  double width, height;
  //Beginning page
  Scaffold buildUnAuthScreen()
  {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Colors.transparent,
      body:  Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[600], Colors.green[600]],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: height * 0.2 ,bottom: height * 0.05),
                  child: Text('EduWorld', style: GoogleFonts.cabin(
                    letterSpacing: 2, //abel
                      color: Colors.black.withOpacity(0.75),                      //fontFamily: ('DancingScript'),
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Image.asset("assets/images/logo.png"),
                  height: height * 0.30,
                ),
                SizedBox(height: 30,),
                _buildLoginBtn(),
              ],
            ),
          ),
          ),
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

