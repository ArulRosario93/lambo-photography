import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingScreen.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/ContainerBlock.dart';
import 'package:login_screen/Widgets/Container/SpecialOffer/SpecialOffer.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage(
      {super.key,
      required this.name,
      required this.snap,
      required this.date,
      required this.time,
      required this.description});

  final List date;
  final String name;
  final String description;
  final snap;
  final time;

  @override
  Widget build(BuildContext context) {
    List cart = [];

    final List lenOfCatagory = snap?["catagory"];

    void handleChange(String catagoryName, int price, String shootName,
        List time, List date, bool isAdded) async {
      if (isAdded) {
        cart.add({
          "CatagoryName": catagoryName,
          "Price": price,
          "shootName": shootName,
          "timeScheduled": time,
          "date": date
        });

        print(cart);

        await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
            .update({"cart": cart});
      } else {
        Map<String, dynamic> itemToRemove = {
          "CatagoryName": catagoryName,
          "Price": price,
          "shootName": shootName,
          "timeScheduled": time,
          "date": date,
        };

        // Find the index of the item in the cart list that matches the properties
        int indexToRemove = cart.indexWhere((item) =>
            item["CatagoryName"] == itemToRemove["CatagoryName"] &&
            item["Price"] == itemToRemove["Price"] &&
            item["shootName"] == itemToRemove["shootName"] &&
            item["timeScheduled"] == itemToRemove["timeScheduled"] &&
            item["date"] == itemToRemove["date"]);

        if (indexToRemove != -1) {
          cart.removeAt(indexToRemove);
        }

        await FirebaseFirestore.instance
            .collection("users")
            .doc("+919043870363")
            .update({"cart": cart});
      }
    }

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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          name,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.black, fontSize: 17)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            for (var i = 0; i < lenOfCatagory.length; i++)
              lenOfCatagory[i]["special"] == false
                  ? ContainerBlock(
                      time: time,
                      date: date,
                      shootname: name,
                      handleChange: handleChange,
                      image: lenOfCatagory[i]["image"],
                      description: description,
                      images: lenOfCatagory[i]["images"],
                      name: lenOfCatagory[i]["name"],
                      offer: lenOfCatagory[i]["offer"],
                      price: lenOfCatagory[i]["price"])
                  : SpecialOffer(
                      time: time,
                      date: date,
                      handleChange: handleChange,
                      shootname: name,
                      image: lenOfCatagory[i]["image"],
                      description: description,
                      images: lenOfCatagory[i]["images"],
                      name: lenOfCatagory[i]["name"],
                      offer: lenOfCatagory[i]["offer"],
                      price: lenOfCatagory[i]["price"]),
            const Padding(padding: EdgeInsets.only(bottom: 80))
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
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2)),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 18, vertical: 5),
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           BillingScreen(name: name  , snap: snap, date: date, time: time, description: description, image: snap["image"],),
                                        //     ));
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
                                  fontSize: 17)),
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
                  border: Border.all(color: Color.fromARGB(171, 255, 255, 255)),
                  boxShadow: [
                    // BoxShadow(
                    //     color: Colors.white, spreadRadius: 5, blurRadius: 70),
                    // BoxShadow(
                    //     color: Colors.white, spreadRadius: 1, blurRadius: 5),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => BillingScreen(name: name, snap: snap, date: date, time: time, description: description, image: snap["image"],),
                    //     ));
                  },
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
