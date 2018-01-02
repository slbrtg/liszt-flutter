import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

class UserAuth {
  Future<String> signupUser(User user) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
    .createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
    );
    return "User created";
  }

  Future<String> loginUser(User user) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
    .signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
    );
    return "User signed in";
  }
}