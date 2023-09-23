import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/ContainerBlock.dart';
import 'package:login_screen/Widgets/Date&Time/Date&Time.dart';

class SlotContainer extends StatelessWidget {
  const SlotContainer(
      {super.key,
      required this.shootName,
      required this.description,
      required this.image,
      required this.snap});

  final String shootName;
  final String image;
  final String description;
  final snap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 200, 200, 200),
            offset: const Offset(
              0,
              0,
            ),
            blurRadius: 7.0,
            spreadRadius: 4.0,
          ), //BoxShadow
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DateAndTime(
                    name: shootName, snap: snap, description: description)),
          );
        },
        child: Stack(
          children: [
            Container(
              // margin: EdgeInsets.symmetric(vertical: 7),
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 280,
                      child: Stack(
                        children: [
                          Container(
                            height: 280,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(image),
                                )),
                          ),
                          Container(
                            height: 280,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              shootName,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              description,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color:
                                          const Color.fromARGB(255, 32, 32, 32),
                                      fontSize: 11)),
                            ),
                          ),
                          Container(
                            child: snap["offer"]
                                ? Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 3),
                                        child: Divider(
                                          thickness: 0.2,
                                          color: const Color.fromARGB(
                                              255, 37, 37, 37),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        alignment: Alignment.centerRight,
                                        child: Row(children: [
                                          Container(
                                            child: Icon(
                                              Icons.offline_bolt,
                                              color: Colors.red,
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2)),
                                          Container(
                                            child: Text(
                                              "Offers Avialable",
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 0, 140, 255),
                                                      fontSize: 12)),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2)),
                                        ]),
                                      )
                                    ],
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
