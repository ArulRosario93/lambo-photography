import 'package:flutter/material.dart';
import 'package:login_screen/Widgets/Login/Login.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: (context, snapshot) {
      return Login();
    });
  }
}