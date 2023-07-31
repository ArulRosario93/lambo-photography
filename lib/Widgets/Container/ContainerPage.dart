import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingScreen.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/ContainerBlock.dart';
import 'package:login_screen/Widgets/Container/ContainerDates/ContainerDates.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage(
      {super.key,
      required this.name,
      required this.snap,
      required this.description});

  final String name;
  final String description;
  final snap;

  @override
  Widget build(BuildContext context) {
    final List lenOfCatagory = snap?["catagory"];

    _CartItem() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 17),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage("assets/image.jpg"))),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Pre Shoot",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black)),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      Container(
                        child: Text(
                          "Baby Shoot",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromARGB(255, 46, 46, 46),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Text(
                "\$69",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black54,
        backgroundColor: Colors.white70,
        title: Text(
            name,
            style:
                GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black, fontSize: 17)),
          ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            ContainerDates(),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            for (var i = 0; i < lenOfCatagory.length; i++)
              ContainerBlock(
                  image: lenOfCatagory[i]["image"],
                  description: description,
                  images: lenOfCatagory[i]["images"],
                  name: lenOfCatagory[i]["name"],
                  offer: lenOfCatagory[i]["offer"],
                  price: lenOfCatagory[i]["price"])
          ],
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 65,
          decoration:
              BoxDecoration(color: Color.fromARGB(255, 255, 0, 0), boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 214, 211, 211),
                blurRadius: 20,
                spreadRadius: 5)
          ]),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(),
                child: InkWell(
                  onTap: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          child: Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15)),
                                  _CartItem(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Color.fromARGB(255, 46, 46, 46),
                                      thickness: 0.2,
                                    ),
                                  ),
                                  _CartItem(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Color.fromARGB(255, 46, 46, 46),
                                      thickness: 0.2,
                                    ),
                                  ),
                                  _CartItem(),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Divider(
                                      color: Color.fromARGB(255, 46, 46, 46),
                                      thickness: 0.2,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2)),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 5),
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => BillingScreen(),
                                          )
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 191, 189, 189),
                                                spreadRadius: 2.0,
                                                blurRadius: 8.0)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.red,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12, horizontal: 24),
                                        child: Text(
                                          "Next",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 16,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 4)),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                  child: Container(
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Text(
                          "View Cart",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 19)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                // alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 17, 0),
                  boxShadow: [
                    // BoxShadow(
                    //     color: Colors.white, spreadRadius: 5, blurRadius: 70),
                    BoxShadow(
                        color: Colors.white, spreadRadius: 1, blurRadius: 5),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BillingScreen(),
                        )
                      );
                  },
                  highlightColor: Color.fromARGB(255, 255, 17, 0),
                  splashColor: const Color.fromARGB(255, 255, 17, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 17, 0),
                    ),
                    child: Text(
                      "Next",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 17)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
