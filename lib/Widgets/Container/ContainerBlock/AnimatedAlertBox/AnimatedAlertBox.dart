import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimatedAlertBox extends StatefulWidget {
  const AnimatedAlertBox(
      {super.key,
      required this.images,
      required this.name,
      required this.handleFunc,
      required this.selected,
      required this.description});

  final String name;
  final handleFunc;
  final bool selected;
  final String description;
  final List images;

  @override
  _AnimatedAlertBoxState createState() => _AnimatedAlertBoxState();
}

class _AnimatedAlertBoxState extends State<AnimatedAlertBox>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  bool? isAdded;

  @override
  void initState() {
    super.initState();
    // Delayed expansion after 1 second

    setState(() {
      isAdded = widget.selected;
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 1500), () {
        setState(() {
          _isExpanded = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void handlechange() {
      setState(() {
        isAdded = !isAdded!;
      });

      widget.handleFunc();                   
    }

    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Container(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          widget.name,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(fontSize: 17),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      content: AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        child: _isExpanded
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      alignment: Alignment.center,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image.jpg'))),
                    ),
                    flex: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 17),
                    alignment: Alignment.center,
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      color: isAdded! ? Colors.black : Colors.red,
                    ),
                    child: InkWell(
                        onTap: () => handlechange(),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                          alignment: Alignment.center,
                          child: Text(
                            isAdded! ? "ADDED" : "ADD",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          ),
                        )),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8))
                ],
              )
            : Container(
                height: 0,
              ),
      ),
    );
  }
}
