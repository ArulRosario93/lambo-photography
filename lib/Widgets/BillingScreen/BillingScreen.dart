import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingItems/BillingItems.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingSummary/BillingSummary.dart';
import 'package:login_screen/Widgets/BillingScreen/CancellationPolicy/CancellationPolicy.dart';
import 'package:login_screen/Widgets/BillingScreen/DateTimeSelection/DateTimeSelection.dart';
import 'package:login_screen/Widgets/BillingScreen/PersonalDetails/PersonalDetails.dart';

class BillingScreen extends StatelessWidget {
  const BillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 255, 252),
      appBar: AppBar(
        foregroundColor: Color.fromARGB(206, 0, 0, 0),
        elevation: 0.6,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 241, 253, 255),
        title: Text("Book your Slot", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 15, color: Colors.black))),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 241, 253, 255),
          child: Expanded(
            child: Column(
              children: [
                  DateTimeSelection(),
                  BillingItems(),
                  BillingSummary(),
                  PersonalDetails(),
                  CancellationPolicy(),
                  Padding(padding: EdgeInsets.only(bottom: 90))
              ],
            )
          ),
        )
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Pay Offline", style: GoogleFonts.poppins(),),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 17, 0),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 195, 177, 177),
                    blurRadius: 16,
                    spreadRadius: 1
                  )
                ]
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: Text("Event Location", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15)),),
            )
          ],
        ),
      ),
    );
  }
}