import 'dart:async';
import 'package:flutter/material.dart';

import '../models/user.dart';
import './firebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class UserData {
  FirebaseDatabase firebaseDatabase;
  UserAuth userAuth = new UserAuth();
  FirebaseUser currentUser;

  retrieveCurrentUser() async {
    await userAuth.getCurrentUser().then((onVal) {
      currentUser = onVal;
    });
    debugPrint(currentUser.toString());
    return currentUser;
  }
}