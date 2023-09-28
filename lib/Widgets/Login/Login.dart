import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_screen/variables/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:login_screen/Authentication/AuthMethods.dart';
import 'package:login_screen/Widgets/Home/Home.dart';
import 'package:login_screen/Widgets/Login/EnterOTP.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController number = TextEditingController();

  TextEditingController _controllers1 = TextEditingController();
  TextEditingController _controllers2 = TextEditingController();
  TextEditingController _controllers3 = TextEditingController();
  TextEditingController _controllers4 = TextEditingController();
  TextEditingController _controllers5 = TextEditingController();
  TextEditingController _controllers6 = TextEditingController();

  bool otpSent = false;

  bool pressed = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  EmailOTP myauth = EmailOTP();
  String verificationID = "";
  List _items = [];

  bool slideIn = false;
  bool loading = false;

  void handleSlide() {
    print("leeese");
    Future.delayed(
        Duration(seconds: 2), () => {setState(() => slideIn = true)});
  }

  @override
  void initState() {
    handleSlide();
    super.initState();
  }

  @override
  void dispose() {
    _controllers1.dispose();
    _controllers2.dispose();
    _controllers3.dispose();
    _controllers4.dispose();
    _controllers5.dispose();
    _controllers6.dispose();
    number.dispose();
    super.dispose();
  }

  ValueNotifier<String> statusNotifier = ValueNotifier<String>("");

  void onStatusChanged(String newValue) async {
    // Perform the desired actions when the status value changes
    if (newValue == "SUCCESS") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        content: Text(
          'Code Sent!',
          style: GoogleFonts.poppins(),
        ),
        duration: const Duration(milliseconds: 2500),
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0, // Inner padding for SnackBar content.
          vertical: 15,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));

      setState(() {
        slideIn = false;
        otpSent = true;
        loading = false;
      });

      Future.delayed(
          Duration(milliseconds: 800),
          () => {
                print("Yo"),
                setState(() => {slideIn = true})
              });
    } else if (newValue == "COMPLETED") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        content: Text(
          'VERIFIED',
          style: GoogleFonts.poppins(),
        ),
        duration: const Duration(milliseconds: 2500), // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0, // Inner padding for SnackBar content.
          vertical: 15,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else if (newValue == "TimeOut") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        content: Text(
          'TimeOut. Try Again.',
          style: GoogleFonts.poppins(),
        ),
        duration: const Duration(milliseconds: 3500), // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0, // Inner padding for SnackBar content.
          vertical: 15,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        content: Text(
          newValue,
          style: GoogleFonts.poppins(),
        ),
        duration: const Duration(milliseconds: 5500), // Width of the SnackBar.
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0, // Inner padding for SnackBar content.
          vertical: 15,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ));

      Future.delayed(Duration(seconds: 6), () => Navigator.pop(context));
    }
  }

  void setStatus(String value) {
    if (value != statusNotifier.value) {
      statusNotifier.value = value;
      onStatusChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool validatePhoneNumber(String phoneNumber) {
      // Regular expression to match a phone number
      // Change the pattern according to your desired phone number format
      String pattern = r'^\d{1,3}\s?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9}$';

      RegExp regExp = RegExp(pattern);
      return regExp.hasMatch(phoneNumber);
    }

    void handleVerificationID(String ID) {
      setState(() {
        verificationID = ID;
      });
    }

    void verifyPhoneNumber(String Number) async {
      setState(() {
        pressed = false;
      });
      if (validatePhoneNumber(Number)) {
        if (Number.length == 10) {
          setState(() {
            loading = true;
          });

          await AuthMethods().verifyMobileNumber(
              CountryCode: "+91",
              Number: Number,
              setStatusFunction: setStatus,
              handleVerificationID: handleVerificationID);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              content: Text(
                'Mobile Number is not Valid!',
                style: GoogleFonts.poppins(),
              ),
              duration:
                  const Duration(milliseconds: 2500), // Width of the SnackBar.
              padding: const EdgeInsets.symmetric(
                horizontal: 18.0, // Inner padding for SnackBar content.
                vertical: 15,
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            content: Text(
              'Mobile Number is not Valid!',
              style: GoogleFonts.poppins(),
            ),
            duration:
                const Duration(milliseconds: 2500), // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0, // Inner padding for SnackBar content.
              vertical: 15,
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      }
    }

    void verifyCodeIn(String doc) async {
      await AuthMethods().verifyMobileNumberCode(
          smsCode: doc,
          setStatusFunction: setStatus,
          verificationID: verificationID);
    }

    void handleSubmit() async {
      // validate data

      setState(() {
        loading = true;
      });

      dynamic doc = _controllers1.text +
          _controllers2.text +
          _controllers3.text +
          _controllers4.text +
          _controllers5.text +
          _controllers6.text;

      // bool result = await myauth.verifyOTP(otp: doc);

      verifyCodeIn(doc);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  // Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Flexible(
                    child: Container(
                      color: Colors.black,
                      // alignment: Alignment.center,
                      // width: 300,
                      child: AnimatedOpacity(
                        opacity: 1,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 600),
                        child: Container(
                            // height: 220,
                            // constraints:
                            //     BoxConstraints(maxHeight: 220, minHeight: 200),
                            // width: 300,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "assets/icon.png",
                                    ),
                                    fit: BoxFit.cover))),
                      ),
                    ),
                    flex: 3,
                  ),

                  Flexible(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            // alignment: Alignment.center,
                            // margin: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 16),
                            // color: Colors.redAccent,
                            // child: Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     Icon(Icons.notification_add_outlined, color: Colors.white,),
                            //     Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                            //     // Text("Invalid Datknou R HGU9HRGU9E BUE 9UAENB UEUB9 pubhup9h bgup 9HAEUP9BH AUPE9H BU9AH BU9AHEU9BHAPU9Huhpiuh u9baheubh aegu9bh agupbh 9aegh begaba", softWrap: true, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                            //   ],
                            // )
                          ),
                          AnimatedOpacity(
                            opacity: slideIn ? 1 : 0,
                            curve: Curves.easeInOut,
                            duration: Duration(milliseconds: 900),
                            child: Column(
                              children: [
                                otpSent
                                    ? Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0))
                                    : Container(
                                        child: Text(
                                          "LOGIN",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 24)),
                                        ),
                                      ),
                                const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5)),
                                otpSent
                                    ? Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 0))
                                    : Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 45),
                                        child: Text(
                                          "Enter your Mobile number to continue, we will send you OTP to verify.",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 13,
                                                  color: const Color.fromARGB(
                                                      255, 31, 31, 31))),
                                        ),
                                      ),    
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: otpSent ? 6 : 18)),
                           Container(
                            child: otpSent
                                ? EnterOTP(
                                    loading: loading,
                                    handleSubmit: handleSubmit,
                                    slideIn: slideIn,
                                    mail: number.text,
                                    controllers1: _controllers1,
                                    controllers2: _controllers2,
                                    controllers3: _controllers3,
                                    controllers4: _controllers4,
                                    controllers5: _controllers5,
                                    controllers6: _controllers6)
                                : AnimatedOpacity(
                                    opacity: slideIn ? 1 : 0,
                                    curve: Curves.easeIn,
                                    duration: Duration(milliseconds: 500),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                          255, 223, 223, 223)
                                                      .withOpacity(0.9),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 0),
                                                )
                                              ]),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 45),
                                          child: TextFormField(
                                            autofillHints: [AutofillHints.telephoneNumber],
                                            autofocus: pressed,
                                            onFieldSubmitted: (value) =>
                                                verifyPhoneNumber(number.text),
                                            controller: number,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIconColor:
                                                  Colors.purpleAccent,
                                              focusColor: Color.fromARGB(
                                                  255, 186, 30, 234),
                                              fillColor: Color.fromARGB(
                                                  255, 186, 30, 234),
                                              hoverColor: Color.fromARGB(
                                                  255, 186, 30, 234),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 9,
                                                      horizontal: 10),
                                              prefixIcon: Icon(Icons.phone),
                                              labelText: 'Mobile  Number',
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 12)),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 30),
                                          // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 12),
                                          child: TextButton(
                                            onPressed: () =>
                                                verifyPhoneNumber(number.text),
                                            child: Container(
                                              width: 500,
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 205, 42, 223),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12),
                                              // margin: EdgeInsets.symmetric(horizontal: 20),
                                              child: loading
                                                  ? Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: 2.0,
                                                      ),
                                                    )
                                                  : Text("Request OTP",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.poppins(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Text("About", style: GoogleFonts.poppins(fontSize: 12)),
        Text(
          "Privacy Policy",
          style: GoogleFonts.poppins(fontSize: 12),
        )
      ],
    );
  }
}
