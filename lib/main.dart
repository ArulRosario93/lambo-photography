import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:login_screen/Widgets/FeaturedPage/FeaturedVariety/FeaturedVariety.dart';
import 'package:login_screen/Widgets/Home/Home.dart';
import 'package:login_screen/Widgets/Login/Login.dart';
import 'package:login_screen/Widgets/Login/LoginController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_live_51J3aNiSJ3cIYDVdDMDMWqj7eGzi09UzisBOUMMMLbGrKzQTK1oxDREKbp5grFC0SASdT1oTLrdHv6MZ16KXrTp9800l1qiN29x";
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Lambo Photography',
      initialRoute: "/",
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return const Home();
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 17, 17, 17),
              ),
            );
          }

          return Home();
        },
      ),
    );
  }
}
