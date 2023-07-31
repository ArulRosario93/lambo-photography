import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EachDate extends StatelessWidget {
  EachDate({super.key, required this.selected, required this.date, required this.day, required this.month});

  bool selected;
  final month;
  final date;
  final day;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("CLiCKED"),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: selected ? Color.fromARGB(255, 255, 17, 0) : Colors.white,
        ),
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              child: Text(
                day,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: selected ? Colors.white : Colors.black,
                )),
              ),
            ),
            Container(
              child: Text(
                date,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: selected ? Colors.white : Colors.black,
                )),
              ),
            ),
            Container(
              child: Text(
                month,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: selected ? Colors.white : Colors.black,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
