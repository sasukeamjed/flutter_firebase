import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase/models/user.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      return null;
    }
  }


}