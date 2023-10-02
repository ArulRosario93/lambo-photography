import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTimeSelection extends StatelessWidget {
  const DateTimeSelection(
      {super.key, required this.date});

  final List date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
      child: Column(
        children: [
          Container(
            width: 280,
                  child: Row(
                    children: [
                      Text("Date: ", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w600)),),

                      Padding(padding: EdgeInsets.symmetric(horizontal: 2)),

                      Row(
                        children: [
                          for(var i = 0; i < date.length; i++)
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              child: Text(date[i], style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight:FontWeight.w400)),),
                            )
                        ],
                      ),
                    
                      Padding(padding: EdgeInsets.symmetric(horizontal: 3)),

                    ],
                  ),
                ),
        ],
      ),
    );
  }
}