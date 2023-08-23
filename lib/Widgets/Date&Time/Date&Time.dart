import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerDates/ContainerDates.dart';
import 'package:login_screen/Widgets/Date&Time/Time/TimeinRow.dart';
import 'package:login_screen/Widgets/FeaturedPage/FeaturedPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_screen/Widgets/FeaturedPage/FeaturedVariety/FeaturedVariety.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime(
      {super.key,
      required this.name,
      required this.snap,
      required this.description});

  final String name;
  final String description;
  final snap;

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  List<String> selectedDate = [];
  List<String> selectedTime = [];

  List finalDate = [];

  var snap1;

  void handleCalled() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection("collections")
        .doc("marriageShoot")
        .get();

    setState(() {
      snap1 = snapshot.data(); // Access the data from the DocumentSnapshot
    });
  }

  @override
  void initState() {
    handleCalled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void handledateSelected(String reversedFormat) {
      setState(() {
        finalDate.add(reversedFormat);
      });
    }

    void handleChangeTime(String time) {
      setState(() {
        if (selectedTime.contains(time)) {
          selectedTime.remove(time);
        } else {
          selectedTime.add(time);
        }
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Baby Shoot",
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(221, 41, 41, 41), fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            alignment: Alignment.center,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 5),
            // height: 500,
            child: ContainerDates(handledateSelected: handledateSelected)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 36, vertical: 20),
            alignment: Alignment.center,
            height: 335,
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  // Prevent the default overscroll indicator from showing
                  overscroll.disallowIndicator();
                  return true;
                },
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List.generate(24, (index) {
                    return TimeInRow(
                      time: index + 1,
                      hrs: "hr",
                      handleChange: handleChangeTime,
                    );
                  }),
                ),
              ),
            )),
      ])),
      bottomSheet: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              print(finalDate);
              print(selectedTime);
              print(widget.description);
              print(widget.snap);
              print(widget.name);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.snap["FeaturedAvailable"]
                          ? FeaturedVariety(
                              snap: snap1,
                              snap1: widget.snap,
                              date: finalDate,
                              description: widget.description,
                              name: widget.name,
                              time: selectedTime)
                          : FeaturedPage(
                              image: widget.snap["image"],
                              name: widget.name,
                              snap: widget.snap,
                              time: selectedTime,
                              date: finalDate,
                              description: widget.description,
                              price: widget.snap["price"],
                              offer: widget.snap["Offer"],
                            )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 255, 17, 0),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
              child: Text(
                "Next",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white)),
              ),
            ),
          )),
    );
  }
}
