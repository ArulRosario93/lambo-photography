import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key, required this.index, required this.snap});

  final int index;
  final snap;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: const Color.fromARGB(255, 212, 208, 208),
            blurRadius: 10,
            spreadRadius: 1)
      ]),
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 15, right: 0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Phone Number: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Text(
                snap["PhoneNumber"],
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 15)),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),
          Row(
            children: [
              Text(
                "Shoot: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              snap["type"] != null
                  ? Text(
                      snap["type"],
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15)),
                    )
                  : Text(""),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Text(
                snap["Shoot"],
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),
          Row(
            children: [
              Text(
                "Payments: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Text(
                snap["Payment"],
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),
          Row(
            children: [
              Text(
                "Payment-ID: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Text(
                snap["PaymentID"],
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),
          Row(
            children: [
              Text(
                "Date: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Container(
                  width: 250,
                  child: Row(
                    children: [
                      for (var i = 0; i < snap["Date"].length; i++)
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              snap["Date"][i],
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15)),
                            )),
                    ],
                  ))
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 6)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Location: ",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Container(
                constraints: BoxConstraints(maxWidth: 230),
                child: Text(
                  snap["location"],
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
