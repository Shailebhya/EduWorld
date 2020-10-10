import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttervit_app/mainfinal.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'models/user.dart';

final usersRef = FirebaseFirestore.instance.collection('usersRef');
final GoogleSignIn googleSignIn =GoogleSignIn();
final timestamp = DateTime.now();
User currentUser;
class Home extends StatefulWidget {
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
    );//Reauthenticate when app is opened!!
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
  //check if user exists in users collection in database according to their id
  final GoogleSignInAccount user = googleSignIn.currentUser;
   DocumentSnapshot doc =await usersRef.doc(user.id).get();

    if(!doc.exists){
      // if the ussr doesnt exist then we want to tske them to create account page
    //
    // final username =await Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccount()));

  //get username from create account , use it to make new user doc.
    //in user collection
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
  Widget buildAuthScreen() {
    checkCategoryPresent();
   if(hasCat==false){return Scaffold(
       key: _scaffoldKey,
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
       ));}
   else return MyHomePage();
  }
  Widget _buildButton(String intro) {
    return Container(

      width: width * .4,
      child: RaisedButton(

        onPressed: (){
          usersRef.doc(currentUser.id).update({'category':intro});
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
        },
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
  Widget _buildLoginBtn() {
    return Container(

      width: width * .6,
      child: RaisedButton(

          onPressed: login,
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

  Scaffold buildUnAuthScreen() {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(backgroundColor: Color(0xFF485079),
      body:  SingleChildScrollView(
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
  // Scaffold buildUnAuthScreen() {
  //   return Scaffold(
  //       backgroundColor: Colors.black,
  //       body: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             GestureDetector(
  //               child: Container(
  //
  //                 child:  Center(
  //                   child: Text("JoinUs",style: TextStyle(
  //                       fontStyle: FontStyle.italic,
  //                       fontSize: 30
  //                   ),),
  //                 ),
  //                 width: 200,
  //                 height: 60,
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //               ),
  //               onDoubleTap: login,
  //             )
  //           ],
  //         ),
  //       )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

