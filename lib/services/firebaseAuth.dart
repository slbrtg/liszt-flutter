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

  Future<FirebaseUser> getCurrentUser() async {
    firebaseAuth = FirebaseAuth.instance;
    FirebaseUser user = await firebaseAuth.currentUser();
    return user;
  }
}