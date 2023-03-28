import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethod{
  final FirebaseAuth _auth;
  FirebaseAuthMethod(this._auth);

  Future<void> phoneSignIn(
      BuildContext context,
      String phoneNumber,
      )async{
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential)async{
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e){
          print(e.message);//UI for error handling
        },
        codeSent: ((String verificationId, int? resendToken)async{
          //showOtpDialog();
        }),
        codeAutoRetrievalTimeout: (value){}
    );
  }

}