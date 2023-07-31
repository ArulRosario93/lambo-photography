import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:login_screen/Models/User.dart' as Model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  String? verficationID;

  Future<String> signUpUserwithEmail({
    required String email,
    required String password,
  }) async {
    String res = "Waiting";

    try {
      //Creating User with Email and Password
      if (email.isNotEmpty || password.isNotEmpty) {
        UserCredential ucred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        Model.User user = Model.User(
          Email: email,
          uid: ucred.user!.uid,
          number: 0,
        );

        await _firestore.collection("users").doc(ucred.user!.uid).set(
              user.toJson(),
            );
      }

      res = "Success";
    } catch (e) {
      res = e.toString();
    }

    return res;
  }

  Future verifyMobileNumber({
    required String Number,
    required String CountryCode,
    required final Function(String) setStatusFunction,
    required handleVerificationID,
  }) async {
    if (Number.isNotEmpty) {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: CountryCode + Number,
        timeout: Duration(minutes: 1),
        verificationCompleted: (PhoneAuthCredential credential) =>
            setStatusFunction("COMPLETED"),
        verificationFailed: (error) async {
          setStatusFunction(error.toString());
        },
        codeSent: (verificationId, forceResendingToken) {
          handleVerificationID(verificationId);
          setStatusFunction("SUCCESS");
        },
        codeAutoRetrievalTimeout: (verificationId) =>
            setStatusFunction("TimeOut"),
      );
    }
  }

  Future verifyMobileNumberCode(
      {required String smsCode,
      required verificationID,
      required final Function(String) setStatusFunction}) async {
    setStatusFunction("Checking");
    try {
      print("passed");
      print(verificationID);
      if (verificationID != null) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: smsCode);

        UserCredential user =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // setStatusFunction("SUCCESS");

        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
            .set({
          "name": "",
          "phoneNumber": FirebaseAuth.instance.currentUser!.phoneNumber,
          "orders": [],
          "emailverification": {
            "emailAddress": "",
            "verified": false,
          },
          "cart": []
        });
      }
    } catch (e) {
      print(smsCode);
      print(e.toString());
      setStatusFunction(e.toString());
    }
  }
}
