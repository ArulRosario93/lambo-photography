import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Admin/AdminLogin/AdminLogin.dart';
import 'package:login_screen/Widgets/Home/LoaderScreen/LoaderScreen.dart';
import 'package:login_screen/Widgets/Home/Slider/SliderHome.dart';
import 'package:login_screen/Widgets/Home/SlotContainer/SlotContainer.dart';
import 'package:login_screen/loaderLine/loaderLines.dart';
import 'package:login_screen/Widgets/Account/Account.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool loaderScreen = false;
  List jsonData = [];
  String loaderString = "";
  bool connectionStatus = false;

  int Number = 0;

  void handleLoadingScreen() {
  // Generate a random index within the range of data's length
  int randomIndex = Random().nextInt(data.length);

  // Get the line associated with the random index
  var dataFound = data[randomIndex];
  String? stringForLoader = dataFound['line'];

  setState(() {
    loaderString = stringForLoader!;
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
      if (connectionStatus) {
        setState(() {
          loaderScreen = true;
        });
      }
    });
  }

  void connectionCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      setState(() {
        connectionStatus = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        connectionStatus = true;
      });
    } else {
      setState(() {
        connectionStatus = false;
      });
    }
  }

  @override
  void initState() {
    connectionCheck();
    handleDataFromDB();
    handleLoadingScreen();
    handleLoaderScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _onItemTapped(int num) {
      if (Number != num) {
        print("Changing");
        setState(() {
          Number = num;
        });
      }
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
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        Container(
                          child: InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AdminLogin(),
                                  )),
                              child: Text(
                                "Rise Up Live A Life",
                                style: GoogleFonts.shadowsIntoLight(
                                    textStyle: TextStyle(fontSize: 32)),
                              )),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LoaderScreen(loaderString: loaderString, network: connectionStatus),
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
                    selectedItemColor: Color.fromARGB(255, 255, 0, 0),
                    // currentIndex: 0,
                    onTap: _onItemTapped,
                  )
                : null,
          )
        : Account();
  }
}
