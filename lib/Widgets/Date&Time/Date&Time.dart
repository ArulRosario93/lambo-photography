import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerDates/ContainerDates.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
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
  List finalDate = [];

  List? dateSelected;

  var snap1;

  String _twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String extractDate(String dateRangeString) {
    // Remove brackets and split the string by comma
    // Remove brackets and split the string by space
    String cleanDate =
        dateRangeString.substring(0, dateRangeString.indexOf(' '));

    // Parse the cleaned string into a DateTime object
    DateTime date = DateTime.parse(cleanDate);

    // Format the DateTime object as desired (in yyyy-MM-dd format)
    String formattedDate =
        "${date.year}-${_twoDigits(date.month)}-${_twoDigits(date.day)}";

    return formattedDate;
  }

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
    setState(() {
      finalDate.replaceRange(0, finalDate.length, []);
    });
    widget.snap["FeaturedAvailable"] ? handleCalled() : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void handledateSelected(String reversedFormat) {
      setState(() {
        finalDate.add(reversedFormat);
      });
    }

    void onSubmit() {
      for (var i = 0; i < dateSelected!.length; i++) {
        // if (dateSelected!.length > 1) {
        String dateRangeString = dateSelected![i].toString();

        // Extract the date from the range string
        String extractedDate = extractDate(dateRangeString);

        DateTime date = DateTime.parse(extractedDate);

        // Format the DateTime object as desired (in dd/MM/yyyy format)
        String reversedFormat =
            "${_twoDigits(date.day)}/${_twoDigits(date.month)}/${date.year}";

        print("Extracted Date: $reversedFormat");

        handledateSelected(reversedFormat);
      }
    }

    void _onDaySelected(
        DateRangePickerSelectionChangedArgs
            dateRangePickerSelectionChangedArgs) {
      setState(() {
        dateSelected = dateRangePickerSelectionChangedArgs.value;
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        foregroundColor: Colors.black,
        elevation: 0.6,
        centerTitle: true,
        title: Text(
          widget.name,
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(221, 41, 41, 41), fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        // const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        Container(
            height: 500,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Text("Pick The Date",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 24))),
                ),
                SizedBox(
                    height: 350,
                    width: 300,
                    // color: Colors.redAccent,
                    child: SfDateRangePicker(
                      // maxDate: l stDate,
                      initialDisplayDate: DateTime.now(),
                      enablePastDates: false,
                      selectionTextStyle:
                          GoogleFonts.poppins(textStyle: TextStyle()),
                      // showActionButtons: true,
                      view: DateRangePickerView.month,
                      selectionMode: DateRangePickerSelectionMode.multiple,
                      onSelectionChanged: _onDaySelected,
                    )),
              ],
            )),
      ])),
      bottomSheet: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {
              onSubmit();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => widget.snap["FeaturedAvailable"]
                          ? FeaturedVariety(
                              snap: snap1,
                              snap1: widget.snap,
                              date: finalDate,
                              description: widget.description,
                              name: widget.name)
                          : FeaturedPage(
                              image: widget.snap["image"],
                              name: widget.name,
                              snap: widget.snap,
                              includes: widget.snap["includes"],
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
