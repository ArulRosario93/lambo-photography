import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerDates/EachDate/EachDate.dart';

class ContainerDates extends StatelessWidget {
  const ContainerDates({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Container(
            child: Icon(Icons.arrow_back_ios_sharp, size: 15,),
          ), 
        ), 
        Container(
          width: 280,
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              EachDate(selected: false, month: "JUN", date: "23", day: "MON",),
              EachDate(selected: true, month: "JUN", date: "24", day: "TUS",),
              EachDate(selected: false, month: "JUN", date: "25", day: "WED",),
              EachDate(selected: false, month: "JUN", date: "26", day: "THU",),
              EachDate(selected: false, month: "JUN", date: "27", day: "FRI",),
              EachDate(selected: false, month: "JUN", date: "28", day: "SAT",),
              EachDate(selected: false, month: "JUN", date: "29", day: "SUN",),
              EachDate(selected: false, month: "JUN", date: "30", day: "MON",),
              EachDate(selected: false, month: "JUN", date: "01", day: "TUS",),
              EachDate(selected: false, month: "JUN", date: "02", day: "WED",),
              EachDate(selected: false, month: "JUN", date: "03", day: "THU",),
              EachDate(selected: false, month: "JUN", date: "04", day: "FRI",),
              EachDate(selected: false, month: "JUN", date: "05", day: "SAT",),
              EachDate(selected: false, month: "JUN", date: "06", day: "SUN",),
              EachDate(selected: false, month: "JUN", date: "07", day: "MON",),
              EachDate(selected: false, month: "JUN", date: "08", day: "TUS",),
              EachDate(selected: false, month: "JUN", date: "09", day: "WED",),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Container(
            child: Icon(Icons.arrow_forward_ios_sharp, size: 15,),
          ), 
        ),
      ],
    );
  }
}