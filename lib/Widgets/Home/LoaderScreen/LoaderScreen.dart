import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key, required this.loaderString});

  final loaderString;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical: 15)),
          Container(
            child: Shimmer.fromColors(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                margin: EdgeInsets.symmetric(horizontal: 20),
                height:100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ), baseColor:Color.fromARGB(255, 241, 241, 241), highlightColor: Color.fromARGB(255, 255, 248, 248)),
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(loaderString, style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(200, 38, 38, 38), fontWeight: FontWeight.w500, fontSize: 13),), textAlign: TextAlign.center,),
              ],
            ),
          ),
          Flexible(
            child: Container(),
            flex: 3,
          )
        ]
      ),
      ),
    );
  }
}
