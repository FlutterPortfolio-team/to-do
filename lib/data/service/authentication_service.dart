import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../helper/routes.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  User get user => _firebaseAuth.currentUser!;

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  /// This won't pop routes so you could do something like
  /// Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  /// after you called this method if you want to pop all routes.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

// showCustomToast() {
//     Fluttertoast.showToast(
//       gravity: ToastGravity.BOTTOM,
//       toastLength: Toast.LENGTH_LONG,
//       msg: ,
//     );
//   }
  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<void> signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      print('start user check');
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.of(context).pushNamed(Routes.homeRoute);
      print('this is the email and password //$email $password///');
    } on FirebaseAuthException catch (e) {
      print(e);
        Fluttertoast.showToast(
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG,
          msg: e.message.toString(),
        );
     

    }
  }

  /// There are a lot of different ways on how you can do exception handling.
  /// This is to make it as easy as possible but a better way would be to
  /// use your own custom class that would take the exception and return better
  /// error messages. That way you can throw, return or whatever you prefer with that instead.
  Future<void> signUp(
      {required String email, required String password, required BuildContext context,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
        Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        msg: 'Sign Up successful!! ',
      );
        Navigator.of(context).pushNamed(Routes.loginRoute);
    } on FirebaseAuthException catch (e) {
       Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        msg: e.message.toString(),
      );
    }
  }
}
