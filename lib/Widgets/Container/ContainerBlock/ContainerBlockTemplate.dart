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
      required this.shootname,
      required this.offer,
      required this.time,
      required this.handleChange,
      required this.date,
      required this.price});

  final String image;
  final int price;
  final handleChange;
  final List date;
  final String shootname;
  final int offer;
  final String name;
  final String description;
  final List images;
  final time;

  @override
  State<ContainerBlockTemplate> createState() => _ContainerBlockTemplateState();
}

class _ContainerBlockTemplateState extends State<ContainerBlockTemplate> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    void handleChange() {
      setState(() {
        isAdded = !isAdded;
      });

      widget.handleChange(widget.name, widget.price, widget.shootname,
          widget.time, widget.date, isAdded);
    }

    String shootName;

    if (widget.name.length > 11) {
      shootName = widget.name.substring(0, 8) + "...";
    } else {
      shootName = widget.name;
    }

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
              margin: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.image))),
            ),
          ),
          Expanded(
            child: Container(
              height: 135,
              padding: EdgeInsets.only(right: 10, left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          // margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                  constraints: BoxConstraints(maxWidth: 110),
                                  // width: 110,
                                  child: Text(
                                    shootName,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 58, 58, 58),
                                            fontSize: 17)),
                                    softWrap: true,
                                  )),
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 6)),
                              InkWell(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => AnimatedAlertBox(
                                        images: widget.images,
                                        selected: isAdded,
                                        name: widget.name,
                                        handleFunc: handleChange,
                                        description: widget.description)),
                                child: Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 17,
                                  height: 17,
                                  padding: const EdgeInsets.all(2),
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
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 1),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 3),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.currency_rupee_outlined,
                                size: 22,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 1),
                                // height: 30,
                                alignment: Alignment.centerLeft,
                                child: Text('${widget.price}',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 22))),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(left: 6, bottom: 2, top: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.offline_bolt,
                                color: Colors.greenAccent,
                                size: 16,
                              ),
                              Text(
                                ' ${widget.offer}% OFF',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: isAdded ? Colors.black : Colors.red,
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () => handleChange(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        alignment: Alignment.center,
                        child: Text(
                          isAdded ? "ADDED" : "ADD",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
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
