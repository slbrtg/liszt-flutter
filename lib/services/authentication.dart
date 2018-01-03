import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class UserAuth {
  FirebaseAuth firebaseAuth;
  Future<String> signupUser(User user) async{
    firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
    .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
    );
    return "user created";
  }

  Future<String> loginUser(User user) async{
    firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
    .signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
    );
    return "user logged in";
  }

  bool isLoggedIn() {
    firebaseAuth = FirebaseAuth.instance;
    if (firebaseAuth.currentUser() == null){
      return false;
    } else {
      print(firebaseAuth.currentUser());
      return true;
    }
  }
}