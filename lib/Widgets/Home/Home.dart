import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Home/LoaderScreen/LoaderScreen.dart';
import 'package:login_screen/Widgets/Home/Slider/SliderHome.dart';
import 'package:login_screen/Widgets/Home/SlotContainer/SlotContainer.dart';
import 'package:login_screen/loaderLine/loaderLines.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/Widgets/Account/Account.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loaderScreen = false;
  List jsonData = [];
  String loaderString = "";

  int Number = 0;

  void handleLoadingScreen() {
    var dataFound = data[0];
    String stringForLoadre = dataFound.values.last;
    setState(() {
      loaderString = stringForLoadre;
    });
  }

  @override
  void dispose() {
    super.dispose();
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
    _onItemTapped(int num) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Account(),
          ));
    }

    return Number == 0
        ? Scaffold(
            extendBodyBehindAppBar: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              // Can include Flexible Space
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              centerTitle: true,
              title: Text(
                "V Studios",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 19,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500)),
              ),
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
                                          color: Color.fromARGB(
                                              255, 148, 148, 148),
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
                        for (var i = 0; i < jsonData.length; i++)
                          SlotContainer(
                              shootName: jsonData[i]["name"],
                              description: jsonData[i]["description"],
                              image: jsonData[i]["image"],
                              snap: jsonData[i]),
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
            bottomNavigationBar: loaderScreen
                ? BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          size: 30,
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        label: 'Account',
                      ),
                    ],
                    currentIndex: Number,
                    selectedItemColor: Color.fromARGB(255, 255, 0, 0),
                    onTap: _onItemTapped,
                  )
                : null,
          )
        : Account();
  }
}
