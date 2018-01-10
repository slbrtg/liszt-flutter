import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import '../models/user.dart';

class UserAuth {
  FirebaseAuth firebaseAuth;

  Future<FirebaseUser> signUp(User user) async {
    firebaseAuth = FirebaseAuth.instance;
    return (
        await firebaseAuth
            .createUserWithEmailAndPassword(
          email: user.email,
          password: user.password,
        )
    );
    // return "user created";
  }

  Future<FirebaseUser> logIn(User user) async{
    firebaseAuth = FirebaseAuth.instance;
    return (
        await firebaseAuth
            .signInWithEmailAndPassword(
          email: user.email,
          password: user.password,
        )
    );
  }

  Future<FirebaseUser> getCurrentUser() async {
    firebaseAuth = FirebaseAuth.instance;
    return (await firebaseAuth.currentUser());
  }

  void signOut() {
    firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signOut();
  }
}