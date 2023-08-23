import 'package:flutter/material.dart';
import 'package:login_screen/Widgets/LocationPage/LocationField.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key, required this.handleLocation});

  final handleLocation;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Location Page"),),
      body: Container(
        child: Column(
          children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20),),
              LocationField(handleLocation: widget.handleLocation)
          ],  
        )
      )
    );
  }
}