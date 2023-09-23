import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      appBar: AppBar(
        title: Text("Location Page", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500)),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
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