

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier{
 FirebaseAuth _auth = FirebaseAuth.instance;
 late String otp;
   late String verificationId;

  get verificationFailed => null;

   Future<void>verifyPhone(BuildContext context,String number)async{
    final PhoneVerificationCompleted verificationCompleted = (PhoneAuthCredential credential)async{
       await _auth.signInWithCredential(credential);
     };
     final  PhoneVerificationFailed verificationFailed = (FirebaseAuthException e){
       print(e.code);
     };
     final PhoneCodeSent otp = (String verificationId, int? resendToken) async{
       this.verificationId = verificationId;
       otpDialog(context,number);
     };
     final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (String verificationId) async{
       timeout: const Duration(seconds: 60);

     };



     try{
       _auth.verifyPhoneNumber(
           phoneNumber: number,
           verificationCompleted: verificationCompleted,
           verificationFailed: verificationFailed,
           codeSent: otp,
           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
     }catch(e){
       print(e);
     }
   }

  otpDialog(BuildContext context, String number) async {
     return showDialog(context: context, builder: (BuildContext context){
       return AlertDialog(
         title: Column(
           children: [
             Text("Verification Code"),
             SizedBox(height: 6),
             Text("Enter the 6 digit otp received")
           ],
         ),
         content: Container(
           height: 85,
           child: TextField(
             textAlign: TextAlign.center,
             keyboardType: TextInputType.number,
             maxLength: 6,
             onChanged: (value){
               this.otp = value ;
             },
           ),
         ),
       );

     });
   }

}