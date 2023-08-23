import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      alignment: Alignment.centerLeft,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Personal Detail", textAlign: TextAlign.left, style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15)),),
          Text("Arul Rosario, 9043870363, itsarrowhere380@gmail.com", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black54, fontSize: 12, fontWeight: FontWeight.w300)),),
        ],
      ),
    );
  }
}