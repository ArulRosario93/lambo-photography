import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingScreen.dart';
import 'package:login_screen/Widgets/FeaturedPage/FeaturedPage.dart';

class FeaturedVariety extends StatelessWidget {
  const FeaturedVariety({super.key, required this.snap, required this.snap1, required this.date, required this.description, required this.name, required this.time});

  final snap;
  final snap1;

  final List date;
  final String name;
  final String description;
  final time;

  @override
  Widget build(BuildContext context) {
    List catagory = snap?["Catagory"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Shoot",
          style: GoogleFonts.poppins(
              color: const Color.fromARGB(221, 41, 41, 41), fontSize: 18),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Text(
              "Select Types",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  for (var i = 0; i < catagory.length; i++)
                  Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 10, left: 28, top: 20),
                      child: Text(
                        catagory[i]["CatagoryType"],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17)),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(catagory[i]["image"]),
                                    fit: BoxFit.cover)),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeaturedPage(name: name, snap: snap1, image: catagory[i]["image"], date: date, time: time, description: description, offer: catagory[i]["Offer"], price: catagory[i]["Price"],),)),
                          child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                catagory[i]["Offer"],
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 18)),
                              ),
                              Container(
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Icon(
                                    Icons.question_mark,
                                    color: Colors.black,
                                    size: 12,
                                  ))
                            ],
                          ),
                        ),)
                        
                      ],
                    ),
                  ])
                  
                ],
              ),
            ),
            Flexible(
              child: Container(),
              flex: 10,
            ),
          ],
        ),
      ),
      // bottomSheet: Container(
      //   height: 80,
      //   margin: EdgeInsets.symmetric(horizontal: 16),
      //   alignment: Alignment.centerRight,
      //   child: InkWell(
      //       onTap: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => BillingScreen(
      //               name: name,
      //               date: date,
      //               time: time,
      //               snap: snap,
      //               description: description,
      //             ),
      //           )),
      //       child: Container(
      //         padding: EdgeInsets.symmetric(vertical: 18, horizontal: 48),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             boxShadow: [
      //               BoxShadow(
      //                 blurRadius: 16,
      //                 spreadRadius: 1,
      //                 color: Color.fromARGB(255, 141, 136, 136),
      //               )
      //             ],
      //             color: const Color.fromARGB(255, 255, 17, 0)),
      //         child: Text(
      //           "Next",
      //           style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
      //         ),
      //       )),
      // ),
    );
  }
}
