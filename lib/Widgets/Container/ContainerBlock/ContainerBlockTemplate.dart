import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/AnimatedAlertBox/AnimatedAlertBox.dart';

class ContainerBlockTemplate extends StatefulWidget {
  const ContainerBlockTemplate(
      {super.key,
      required this.image,
      required this.name,
      required this.description,
      required this.images,
      required this.offer,
      required this.price});

  final String image;
  final int price;
  final int offer;
  final String name;
  final String description;
  final List images;

  @override
  State<ContainerBlockTemplate> createState() => _ContainerBlockTemplateState();
}

class _ContainerBlockTemplateState extends State<ContainerBlockTemplate> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    void handleChange = () async {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
          .update({"orders": ["ohh yea"]});
    };

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromARGB(255, 191, 189, 189),
            spreadRadius: 2.0,
            blurRadius: 8.0)
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 6),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
                height: 145,
                width: 115,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  // image: DecorationImage(
                  //     fit: BoxFit.cover, image: NetworkImage(widget.image))
                ),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Center(
                        child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
                      height: 145,
                      alignment: Alignment.center,
                      width: 115,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                    ));
                  },
                )),
          ),
          // const Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
          Expanded(
            child: Container(
              height: 135,
              padding: EdgeInsets.only(right: 10, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        // margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              widget.name,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 58, 58, 58),
                                      fontSize: 19)),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6)),
                            InkWell(
                              onTap: () => showDialog(
                                  context: context,
                                  builder: (context) => AnimatedAlertBox(
                                      images: widget.images,
                                      name: widget.name,
                                      description: widget.description)),
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                width: 17,
                                height: 17,
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 0.5,
                                    )),
                                child: Icon(
                                  Icons.question_mark_rounded,
                                  size: 9,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.only(left: 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.currency_rupee_outlined,
                              size: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 1),
                              // height: 30,
                              alignment: Alignment.center,
                              child: Text('${widget.price}',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.amberAccent,
                    padding: EdgeInsets.only(left: 6, bottom: 2, top: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(
                            Icons.offline_bolt,
                            color: Colors.greenAccent,
                            size: 14,
                          ),
                        ),
                        Container(
                          child: Text(
                            ' ${widget.offer}% OFF',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: isAdded ? Colors.black : Colors.red,
                      ),
                      // padding: const EdgeInsets.only(top: 0, left: 10),
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap:() => handleChange,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          alignment: Alignment.center,
                          child: Text(
                            isAdded ? "ADDED" : "ADD",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16)),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
