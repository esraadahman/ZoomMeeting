import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthMethods {
  // for user accounts
  static final FirebaseAuth _auth = FirebaseAuth.instance;
// for date store
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

/* If you need real-time updates on authentication state (e.g., handling sign-out or token expiration), use StreamBuilder.
If you just need a one-time check at app startup and don't care about real-time updates, .**/
  Stream<User?> get authChanges => _auth.authStateChanges();
  User get user => _auth.currentUser!;

  static Future<bool> signInWithGoogle(BuildContext context) async {
    bool isSignedIn = false;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential usercredential =
          await _auth.signInWithCredential(credential);

      User? user = usercredential.user;
      if (user != null) {
        // user create account right now (first time to sign up)

        if (usercredential.additionalUserInfo!.isNewUser) {
          await _firestore.collection("users").doc(user.uid).set({
            "userName": user.displayName,
            "uid": user.uid,
            "profilePhoto": user.photoURL,
          });
        }
        isSignedIn = true;
      }
    } on FirebaseAuthException catch (e) {
      isSignedIn = false;
      //  showSnackBar(context, e.message!);
      print(e.toString());
    }
    return isSignedIn;
  }

  static Future<void> saveMeetingToHistory(
      String userId, String callID, String userName) async {
    try {
      await _firestore
          .collection("users")
          .doc(userId)
          .collection("meetings")
          .doc(callID)
          .set({
        "callID": callID,
        "userName": userName,
        "uid": userId,
        "startTime": FieldValue.serverTimestamp(),
        "status": "active",
      });
      print("Meeting saved successfully.");
    } catch (e) {
      print("Error saving meeting: $e");
    }
  }

 static Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();
}
