import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecobi_app/src/core/providers/base_model.dart';

import '../constants/constants.dart';

class AuthProvider extends BaseModel {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void createNewUser(String email, String password) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future signIn(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  void logOut() async {
    await firebaseAuth.signOut();
  }
}
