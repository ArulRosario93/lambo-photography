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
          "Select Types",
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
            // Text(
            //   "Select Types",
            //   style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              child: Column(
                children: [
                  for (var i = 0; i < catagory.length; i++)
                  Column(children: [
                    Stack(
                      children: [
                        Container(
                            alignment: Alignment.center,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: NetworkImage(catagory[i]["image"]),
                                    fit: BoxFit.cover)),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeaturedPage(type: catagory[i]["CatagoryType"], name: name, snap: snap1, image: catagory[i]["image"], date: date, time: time, description: description, offer: catagory[i]["Offer"], price: catagory[i]["Price"],),)),
                          child: Container(
                          alignment: Alignment.center,
                          height: 150,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          // padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 150,
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: 18),
                                child: Text(
                                  catagory[i]["CatagoryType"],
                                  style: GoogleFonts.cinzel(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white)),
                                ),
                              ),
                              // Text(
                              //   catagory[i]["Offer"] + "%",
                              //   style: GoogleFonts.poppins(
                              //       textStyle: const TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 16,
                              //           fontWeight: FontWeight.w500)),
                              // ),
                            ],
                          ),
                        ),)
                        
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 8))
                  ])
                  
                ],
              ),
            ),
            Flexible(
              child: Container(),
              flex: 2,
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
