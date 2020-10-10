
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String email;
  final String photoUrl;
  final String displayName;
  final String bio;
  final String category;
  final String gender;
  final String age;
  final String grade;
  final String mode;
  final String timing;
  final String price;
  final String qualification;


  User({
    this.id,
    this.email,
    this.photoUrl,
    this.displayName,
    this.bio,
    this.category,
    this.gender,
    this.age,
    this.grade,
    this.mode,
    this.timing,
    this.price,
    this.qualification,
  });
factory User.fromDocument(DocumentSnapshot doc){
  return User(
    id: doc['id'],
    email: doc['email'],
    photoUrl: doc['photoUrl'],
    displayName: doc['displayName'],
    bio: doc['bio'],
    category : doc['category']

  );
}

}