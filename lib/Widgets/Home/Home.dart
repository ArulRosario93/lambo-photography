import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Authentication/AuthMethods.dart';
import 'package:login_screen/Widgets/Home/LoaderScreen/LoaderScreen.dart';
import 'package:login_screen/Widgets/Home/Slider/SliderHome.dart';
import 'package:login_screen/Widgets/Home/SlotContainer/SlotContainer.dart';
import 'package:login_screen/loaderLine/loaderLines.dart';
import 'package:pay/pay.dart';

import 'package:login_screen/default_payment_profile_google_pay.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loaderScreen = false;
  List jsonData = [];
  String loaderString = "";

  void handleLoadingScreen() {
    var dataFound = data[0];
    String stringForLoadre = dataFound.values.last;
    setState(() {
      loaderString = stringForLoadre;
    });
  }

  void handleDataFromDB() async {
    await FirebaseFirestore.instance
        .collection("collections")
        .get()
        .then((value) => {
          setState(() {
            jsonData = value.docs;
          })
        });
  }

  void handleLoaderScreen() {
    Future.delayed(Duration(seconds: 7), () {
      setState(() {
        loaderScreen = true;
      });
    });
  }

  @override
  void initState() {
    handleDataFromDB();
    handleLoadingScreen();
    handleLoaderScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '99.99',
        status: PaymentItemStatus.final_price,
      )
    ];

    var googlePlayBtn = GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: _paymentItems,
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => print(result),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
      childOnError: Container(child: Text("ERROR FOUND")),
    );

    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Can include Flexible Space
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Lambo",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15))),
              Text("Photography",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 15))),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
              alignment: Alignment.center,
              // padding: EdgeInsets.only(right: 16, left: 16),
              onPressed: () => {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Container(
                          child: Text("User Details", textAlign: TextAlign.center, style: GoogleFonts.poppins(),),
                        ),
                        content: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Text("Arul Rosario", style: GoogleFonts.poppins(),),
                              ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                              Container(
                                child: Text("9043870363", style: GoogleFonts.poppins(),),
                              ),
                            ],
                          ),
                        )
                      ),
                    ),
                  },
              icon: Icon(
                Icons.account_circle_sharp,
                color: Color.fromARGB(255, 40, 40, 40),
                size: 30,
              ))
        ],
        toolbarHeight: 67.0,
      ),
      body: loaderScreen
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SliderHome(),
                  Padding(padding: EdgeInsets.symmetric(vertical: 13)),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Divider(
                            thickness: 0.2,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: Text(
                              "FEATURED",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.quattrocento(
                                textStyle: TextStyle(
                                    color: Color.fromARGB(255, 148, 148, 148),
                                    fontWeight: FontWeight.w100,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Divider(
                            thickness: 0.2,
                            color: Color.fromARGB(255, 52, 52, 52),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                  for(var i = 0; i < jsonData.length; i++)
                    SlotContainer(shootName: jsonData[i]["name"], description: jsonData[i]["description"], image: jsonData[i]["image"], snap: jsonData[i]),
                  
                  // StreamBuilder(
                  //   stream:  FirebaseFirestore.instance.collection("collections").snapshots(),
                  //   builder:(context, snapshot){

                  //     final snap = snapshot.data!.docs;

                  //     final name = snap["name"];

                  //   if (snapshot.hasData) {
                  //       return SlotContainer(image: , shootName: , description: ,),
                  //   }

                  //   return CircularProgressIndicator()
                  // } ,),


                  // SlotContainer(image: , shootName: , description: ,),
                  // SlotContainer(image: , shootName: , description: ,),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: googlePlayBtn)
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoaderScreen(loaderString: loaderString),
              ],
            ),
    );
  }
}
