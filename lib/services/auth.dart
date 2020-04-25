import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class User {
  User({@required this.uid});
  final String uid;
}

abstract class AuthBase {
  Stream<User> get onAuthStateChange;
  Future<User> currentUser();
  Future<User> singInWithEmailPass(String email, String pass);
  Future<User> regInWithEmailPass(String email, String pass);
  Future<void> singOut();
}

class Auth implements AuthBase {
  final _fireBaseAuth = FirebaseAuth.instance;
  User _userFromFireBase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Stream<User> get onAuthStateChange {
    return _fireBaseAuth.onAuthStateChanged.map(_userFromFireBase);
  }

  @override
  Future<User> currentUser() async {
    final user = await _fireBaseAuth.currentUser();
    return _userFromFireBase(user);
  }

  @override
  Future<User> singInWithEmailPass(String email, String pass) async {
    final authResult = await _fireBaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    return _userFromFireBase(authResult.user);
  }

  @override
  Future<User> regInWithEmailPass(String email, String pass) async {
    final authResult = await _fireBaseAuth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return _userFromFireBase(authResult.user);
  }

  @override
  Future<void> singOut() async {
    await _fireBaseAuth.signOut();
  }
}
