import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_web_plugins/src/plugin_registry.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

import '../Screen/Home.dart';
import '../Screen/Login.dart';

class AuthService{

  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData){
          return Home();
        }else{
          return const Login();
        }
      },
    );
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: <String>["email"]
    ).signIn();

    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async{
    /*final GoogleSignInAccount? googleUser = await GoogleSignIn(
    ).signOut();

    final googleWeb = await GoogleSignInPlugin(
    ).signOut();

    FirebaseAuth.instance.signOut();
    return googleWeb;*/
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = new GoogleSignIn();

    Future<Null> signOutWithGoogle() async {
      // Sign out with firebase
      await firebaseAuth.signOut();
      // Sign out with google
      await googleSignIn.signOut();
    }

  }

  Future<Null> signOutWithGoogle() async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = new GoogleSignIn();
    // Sign out with firebase
    await firebaseAuth.signOut();
    // Sign out with google
    await googleSignIn.signOut();
  }
}