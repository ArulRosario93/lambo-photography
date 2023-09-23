import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingScreen.dart';

class FeaturedPage extends StatelessWidget {
  const FeaturedPage(
      {super.key,
      required this.name,
      required this.snap,
      required this.date,
      required this.time,
      required this.offer,
      required this.price,
      this.type,
      required this.image,
      required this.description});

  final List date;
  final type;
  final String name;
  final String description;
  final snap;
  final offer;
  final price;
  final time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.black54,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          name,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(color: Colors.black, fontSize: 17)),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Container(
              child: Text(
                "Date Selected",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < date.length; i++)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: Text(
                          "${date[i]}",
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                  ],
                )),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Container(
              child: InkWell(
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(73, 0, 0, 0),
                                spreadRadius: 1,
                                blurRadius: 14)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(image), fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(9),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            offer + "%",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),

            type != null? Text(type, style: GoogleFonts.poppins(textStyle: type == "Gold" ?TextStyle(color: Color.fromARGB(255, 255, 191, 0), fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600): type == "Silver"? TextStyle(color: Color.fromARGB(255, 169, 169, 169), fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600): TextStyle(color: Color.fromARGB(255, 129, 138, 116), fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w600),)): Text(""),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Includes",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5)),
                        for (var i = 0; i < snap["includes"].length; i++)
                          Container(
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: const Color.fromARGB(255, 255, 17, 0),
                                  size: 18,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2)),
                                Text(
                                  snap["includes"][i],
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ],
                            ),
                          ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Cost",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        Container(
                            child: Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 19,
                              fill: 1,
                            ),
                            Text(
                              price,
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Padding(padding: EdgeInsets.symmetric(vertical: 2)),
            Flexible(
              child: Container(),
              flex: 10,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerRight,
        child: InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BillingScreen(
                    name: name,
                    date: date,
                    price: price,
                    type: type,
                    time: time,
                    snap: snap,
                    image: image,
                    description: description,
                  ),
                )),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 48),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 16,
                      spreadRadius: 1,
                      color: Color.fromARGB(255, 141, 136, 136),
                    )
                  ],
                  color: const Color.fromARGB(255, 255, 17, 0)),
              child: Text(
                "Next",
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),
              ),
            )),
      ),
    );
  }
}
