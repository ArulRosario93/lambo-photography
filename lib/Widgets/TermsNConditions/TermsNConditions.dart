import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsNConditions extends StatelessWidget {
  const TermsNConditions({super.key, required this.snap});

  final snap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 29, 78),
          title: Text(
            "Back",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.white,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            Text(
              snap["head"],
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 29, 78))),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              width: 20,
              child: Divider(
                color: Color.fromARGB(255, 0, 29, 78),
                thickness: 5.0,
              ),
            ),
            Text(
              snap["lastupdated"],
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Color.fromARGB(255, 0, 42, 115))),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var i = 0; i < snap["para"].length; i++)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Text(
                    snap["para"][i],
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(color: Color.fromARGB(199, 0, 0, 111), fontSize: 15)),
                  ),
                )
              ],
            ),

            snap["collect"] != null? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Text(
                  "We may collect the following information:",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 6, 0, 110),
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
                for (var i = 0; i < snap["collect"].length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      size: 8,
                      color: const Color.fromARGB(255, 0, 93, 169),
                    ),
                    titleAlignment: ListTileTitleAlignment.center,
                    horizontalTitleGap: 0.0,
                    minVerticalPadding: 0.0,
                    title: Text(
                      snap["collect"][i],
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                    ),
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
              ],
            ): Text(""),

            snap["gather"] != null?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),

                Text(
                  "What we do with the information we gather",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                          color: Color.fromARGB(255, 6, 0, 110),
                          fontWeight: FontWeight.w600)),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                Text(
                  "We require this information to understand your needs and provide you with a better service, and in particular for the following reasons:",
                  style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                ),
                for (var i = 0; i < snap["gather"].length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      size: 8,
                      color: const Color.fromARGB(255, 0, 93, 169),
                    ),
                    horizontalTitleGap: 0.0,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(
                      snap["collect"][i],
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                    ),
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 3)),
                Text(
                  "We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure we have put in suitable measures.",
                  style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                ),
              ],
            ): Text(""),

            snap["cookies"] != null? Column(
              children: [
                for (var i = 0; i < snap["cookies"].length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      size: 8,
                      color: const Color.fromARGB(255, 0, 93, 169),
                    ),
                    horizontalTitleGap: 0.0,
                    title: Text(
                      snap["cookies"][i],
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                    ),
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
              ],
            ): Text(""),

            snap["personalInfo"] != null? Column(
              children: [
                Text(
                  "You may choose to restrict the collection or use of your personal information in the following ways:",
                  style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                ),

                for (var i = 0; i < snap["personalInfo"].length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      size: 8,
                      color: const Color.fromARGB(255, 0, 93, 169),
                    ),
                    horizontalTitleGap: 0.0,
                    title: Text(
                      snap["cookies"][i],
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                    ),
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
                  Text("We will not sell, distribute or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen.", style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110)))),
                  Text("If you believe that any information we are holding on you is incorrect or incomplete, please write to or email us as soon as possible, at the above address. We will promptly correct any information found to be incorrect.", style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110)))),
              ],
            ): Text(""),

            snap["keypoint"] != null?
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We use this App is subject to the following terms of use:",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color.fromARGB(255, 6, 0, 110),
                          fontWeight: FontWeight.w600)),
                ),
                for (var i = 0; i < snap["keypoint"].length; i++)
                  ListTile(
                    leading: Icon(
                      Icons.circle,
                      size: 8,
                      color: const Color.fromARGB(255, 0, 93, 169),
                    ),
                    horizontalTitleGap: 0.0,
                    title: Text(
                      snap["keypoint"][i],
                      style: GoogleFonts.poppins(
                          textStyle:
                              TextStyle(color: Color.fromARGB(255, 6, 0, 110))),
                    ),
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10))
              ],
            ): Text(""),
          ]),
        )));
  }
}
