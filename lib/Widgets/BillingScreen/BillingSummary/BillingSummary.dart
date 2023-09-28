import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class BillingSummary extends StatelessWidget {
  const BillingSummary(
      {super.key, required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    String val = price;

    int amount = int.parse(val);

    double gst = amount * 18 / 100;

    double grandAmount = amount + gst;

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
                    child: Text(
                  "Billing Summary",
                  style: GoogleFonts.vollkornSc(
                      textStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
                          fontWeight: FontWeight.w100)),
                )),
                Flexible(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      height: 5,
                      alignment: Alignment.center,
                      child: Divider(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(33, 0, 0, 0),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sub Total",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_sharp,
                          size: 17,
                        ),
                        Text(
                          price,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87)),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "GST",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400)),
                            ),
                            // Icon(Icons.question_mark, color: Colors.red, size: 18,),
                          ],
                        )),
                    Row(
                      children: [
                        Text(
                          "18%",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400)),
                        )
                      ],
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Container(
                  alignment: Alignment.center,
                  child: Divider(
                    color: Colors.black26,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Grand Total",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_sharp,
                          size: 17,
                          weight: 5,
                        ),
                        Text(
                          "${grandAmount}",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        )
                      ],
                    ),
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
