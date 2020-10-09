import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:google_sign_in/google_sign_in.dart';
import 'create_account.dart';
import 'models/user.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';


final GoogleSignIn googleSignIn =GoogleSignIn();
// final StorageReference storageRef= FirebaseStorage.instance.ref();
// final usersRef = Firestore.instance.collection('users');
// final postsRef = Firestore.instance.collection('posts');
// final commentsRef=Firestore.instance.collection('comments');
// final followersRef= Firestore.instance.collection('followers');
// final followingRef= Firestore.instance.collection('following');
// final timelineRef= Firestore.instance.collection('timeline');
// final activityFeedRef= Firestore.instance.collection('feed');
final timestamp = DateTime.now();
User currentUser;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey=GlobalKey<ScaffoldState>();
  bool isAuth = false;
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
    "timestamp":timestamp
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

  Widget buildAuthScreen() {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME TO THE HOME PAGE"),
            RaisedButton(
              child: Text("logOUT"),
              onPressed: logout,
            )
          ],
        ),
      ),
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(

                child:  Center(
                  child: Text("JoinUs",style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 30
                  ),),
                ),
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onDoubleTap: login,
            )
          ],
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}

