import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
      child: Column(
        children: [
          Container(
                  child: Row(
                    children: [
                      Text("Date: ", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w600)),),

                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),

                      Text("25/05/2023", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w400)),),
                    
                      Padding(padding: EdgeInsets.symmetric(horizontal: 3)),

                      Icon(Icons.edit, size: 17,)
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.symmetric(vertical: 3)),

                Container(
                  child: Row(
                    children: [
                      Text("Time Slot: ", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w600)),),

                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),

                      Text("4pm - 6pm", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w400)),),
                    
                      Padding(padding: EdgeInsets.symmetric(horizontal: 3)),

                      Icon(Icons.edit, size: 17,)
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}