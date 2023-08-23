import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/AnimatedAlertBox/AnimatedAlertBox.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer(
      {super.key,
      required this.image,
      required this.images,
      required this.description,
      required this.name,
      required this.offer,
      required this.date,
      required this.shootname,
      required this.handleChange,
      required this.time,
      required this.price});

  final String image;
  final String name;
  final shootname;
  final List date;
  final handleChange;
  final String description;
  final List images;
  final int offer;
  final int price;
  final time;

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    void handleClicked() {
      setState(() {
        selected = !selected;
      });

      widget.handleChange(widget.name, widget.price, widget.shootname,
          widget.time, widget.date, selected);
    }

    return InkWell(
      onTap: () => showDialog(
          context: context,
          builder: (context) => AnimatedAlertBox(
              handleFunc: handleClicked,
              images: widget.images,
              name: widget.shootname,
              selected: selected,
              description: widget.description)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Stack(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.image),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 191, 189, 189),
                      spreadRadius: 2.0,
                      blurRadius: 8.0)
                ],
              ),
            ),
            Container(
              height: 280,
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              child: Text(
                '${widget.offer}%',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 280,
              alignment: Alignment.centerLeft,
              // margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 26, top: 85),
              child: Text(
                widget.shootname,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 280,
              alignment: Alignment.bottomRight,
              child: InkWell(
                  onTap: () => handleClicked(),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, bottom: 0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                    child: Text(
                      selected ? "ADDED" : "ADD",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
