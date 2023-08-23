import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingItems/Items/Items.dart';

class BillingItems extends StatelessWidget {
  const BillingItems({super.key, required this.snap, required this.image});

  final snap, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Items",
            textAlign: TextAlign.left,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
          ),
          Items(
            shootCatagory: "",
            shootName: snap["name"],
            shootPrice: snap["price"],
            image: image
          ),
        ],
      ),
    );
  }
}
