import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingScreen.dart';
import 'package:login_screen/Widgets/FeaturedPage/FeaturedPage.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedVariety extends StatelessWidget {
  const FeaturedVariety({super.key, required this.snap, required this.snap1, required this.date, required this.description, required this.name});

  final snap;
  final snap1;

  final List date;
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    List catagory = snap?["Catagory"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0.6,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Stack(
                      children: [
                        Container(
                          child: Shimmer.fromColors(child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 350, minWidth: 300),
                                // margin: EdgeInsets.symmetric(horizontal: 20),
                                height:150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                                ),
                              ),
                            ],
                          ), baseColor:Color.fromARGB(255, 241, 241, 241), highlightColor: Color.fromARGB(255, 255, 248, 248)),
                        ),
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
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FeaturedPage(type: catagory[i]["CatagoryType"], includes: catagory[i]["includes"], name: name, snap: snap, image: catagory[i]["image"], date: date, description: description, offer: catagory[i]["Offer"], price: catagory[i]["Price"],),)),
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
                            ],
                          ),
                        ),),
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
    );
  }
}
