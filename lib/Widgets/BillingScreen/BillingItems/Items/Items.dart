import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Items extends StatelessWidget {
  const Items({super.key, required this.shootCatagory, required this.shootName, required this.shootPrice, required this.image});

  final String shootCatagory;
  final String shootName;
  final String shootPrice;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(68, 0, 0, 0),
            blurRadius: 10,
            spreadRadius: 1,
          )
        ]    
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 69,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover)),
                ),
                Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shootCatagory.length > 1? Container(
                        child: Text(
                          shootCatagory,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87)),
                        ),
                      ): const Padding(padding: EdgeInsets.zero,),
                      Container(
                        child: Text(
                          shootName,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(Icons.currency_rupee, size: 19, fill: 1,),
                Text(
                  shootPrice,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}