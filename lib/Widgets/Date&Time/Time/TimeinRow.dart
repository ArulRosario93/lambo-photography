import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeInRow extends StatefulWidget {
  const TimeInRow(
      {super.key,
      required this.handleChange,
      required this.time,
      required this.hrs});

  final handleChange;
  final time;
  final hrs;

  @override
  State<TimeInRow> createState() => _TimeInRowState();
}

class _TimeInRowState extends State<TimeInRow> {
  bool selected = false;

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    addTolist(String time, String hrs) {
        widget.handleChange(time+hrs);
      print(list);
    }

    handleClick() {
      setState(() {
        selected = !selected;
      });
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: 50,
      height: 80,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
          color: selected ? Color.fromARGB(255, 255, 0, 0) : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 204, 204, 204),
                blurRadius: 5,
                spreadRadius: 1)
          ]),
      child: InkWell(
        onTap: () {
          handleClick();
          addTolist("${widget.time}", widget.hrs);
          // widget.handleChange(list);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("MON", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 13)),),
            Text(
              "${widget.time}",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: selected
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.black,
                      fontSize: 13)),
            ),
            Text(
              "${widget.hrs}",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: selected
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : Colors.black,
                      fontSize: 13)),
            ),
          ],
        ),
      ),
    );
  }
}
