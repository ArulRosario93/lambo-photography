import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CancellationPolicy extends StatelessWidget {
  const CancellationPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(33, 0, 0, 0),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Cancellation Policy", textAlign: TextAlign.center, style: GoogleFonts.vollkornSc(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 13)),),
          Text("Won't be applicable. Blah Blah Blah..", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w300)),),
        ],
      ),
    );
  }
}