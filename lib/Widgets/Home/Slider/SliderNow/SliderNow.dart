import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderNow extends StatelessWidget {
  const SliderNow({super.key, required this.name, required this.image});

  final name;
  final image;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          name,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 17),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(image))),
                ),
                flex: 2,
              ),
            ],
          )),
    );
  }
}
