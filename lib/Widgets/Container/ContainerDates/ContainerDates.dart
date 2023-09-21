import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ContainerDates extends StatefulWidget {
  const ContainerDates({super.key, required this.handledateSelected});

  final handledateSelected;

  @override
  State<ContainerDates> createState() => _ContainerDatesState();
}

class _ContainerDatesState extends State<ContainerDates> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime lastDate = now.add(Duration(days: 30 * 6));

    // List finalDate = [];

    List? dateSelected;

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

    void _onDaySelected(
        DateRangePickerSelectionChangedArgs
            dateRangePickerSelectionChangedArgs) {
      setState(() {
        dateSelected = dateRangePickerSelectionChangedArgs.value;
      });
    }

    String _twoDigitsConverter(int n) {
      if (n >= 10) return "$n";
      return "0$n";
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

        widget.handledateSelected(reversedFormat);

        // setState(() {
        //   finalDate.add(reversedFormat);
        // });
      }
      
      // Navigator.pop(context);
    }

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 255, 17, 0),
        ),
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Container(
                alignment: Alignment.center,
                child: Text(
                  "Pick a Date",
                  style: GoogleFonts.poppins(textStyle: TextStyle()),
                ),
              ),
              content: Container(
                  height: 500,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          height: 350,
                          width: 300,
                          // color: Colors.redAccent,
                          child: SfDateRangePicker(
                            maxDate: lastDate,
                            initialDisplayDate: DateTime.now(),
                            enablePastDates: false,
                            selectionTextStyle:
                                GoogleFonts.poppins(textStyle: TextStyle()),
                            // showActionButtons: true,
                            view: DateRangePickerView.month,
                            selectionMode:
                                DateRangePickerSelectionMode.multiple,
                            onSelectionChanged: _onDaySelected,
                            // onSubmit: (p0) => onSubmit(p0!),
                          )),
                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => onSubmit(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(255, 255, 17, 0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Text(
                              "Ok",
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: Text(
                "Pick a date",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 255))),
              )),
        ));
  }
}
