import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingSummary extends StatelessWidget {
  const BillingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Flexible(
                flex: 1,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    height: 5,
                    alignment: Alignment.center,
                    child: Divider(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                
                Container(
                  child: Text("Billing Summary", style: GoogleFonts.vollkornSc(textStyle: TextStyle(color: Colors.black45, fontSize: 15, fontWeight: FontWeight.w100)),)
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    height: 5,
                    alignment: Alignment.center,
                    child: Divider(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 255, 255, 255)
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sub Total", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),),
                    Text("\$140", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),)
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,), 
                      child: Row(
                        children: [
                          Text("GST", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),),
                          // Icon(Icons.question_mark, color: Colors.red, size: 18,),
                        ],
                      ) 
                    ),
                    Text("\$90", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),)

                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,), 
                      child: Row(
                        children: [
                          // Icon(Icons.home_max, size: 18,),
                          // Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          Text("Extra", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),),
                        ],
                      ) 
                    ),
                    Text("\$80", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),)
                  ],
                ),

                Container(
                  alignment: Alignment.center,
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Grand Total", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),),
                    Text("\$200", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}