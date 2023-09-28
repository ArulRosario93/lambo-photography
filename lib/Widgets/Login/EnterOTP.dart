import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterOTP extends StatefulWidget {
  EnterOTP({super.key, required this.loading, required this.mail, required this.handleSubmit, required this.slideIn, required this.controllers1, required this.controllers2, required this.controllers3, required this.controllers4, required this.controllers5, required this.controllers6});

  final controllers1;
  final controllers2;
  final controllers3;
  final controllers4;
  final controllers5;
  final controllers6;
  bool slideIn;
  bool loading;
  final handleSubmit;
  final mail;

  @override
  State<EnterOTP> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EnterOTP> {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: widget.slideIn ? 1 : 0,
        
        duration: Duration(seconds: 1),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    "OTP sent to Phone Number",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 13,)),
                  ), Text(
                    widget.mail,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 9)),
            Container(
              child: Text(
                "Enter OTP",
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {FocusScope.of(context).nextFocus()}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers2,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {FocusScope.of(context).nextFocus()}
                        else if (value.length == 0)
                          {FocusScope.of(context).previousFocus()}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers3,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      
                      onChanged: (value) => {
                        if (value.length == 1)
                          {FocusScope.of(context).nextFocus()}
                        else if (value.length == 0)
                          {FocusScope.of(context).previousFocus()}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers4,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {FocusScope.of(context).nextFocus()}
                        else if (value.length == 0)
                          {FocusScope.of(context).previousFocus()}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers5,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1)
                          {FocusScope.of(context).nextFocus()}
                        else if (value.length == 0)
                          {FocusScope.of(context).previousFocus()}
                      },
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                    height: 46.0,
                    child: TextFormField(
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      controller: widget.controllers6,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) => {
                        if (value.length == 1){
                          widget.handleSubmit()
                        } else if (value.length == 0)
                          {FocusScope.of(context).previousFocus()}
                      },
                    ),
                  ),
                  // SizedBox(
                  //   width: 50.0,
                  //   height: 46.0,
                  //   child: TextFormField(
                  //     style: GoogleFonts.poppins(
                  //         textStyle: TextStyle(
                  //             fontSize: 20, fontWeight: FontWeight.w500)),
                  //     controller: widget.controllers6,
                  //     decoration: InputDecoration(
                  //         contentPadding: EdgeInsets.all(5),
                  //         border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(5))),
                  //     textAlign: TextAlign.center,
                  //     keyboardType: TextInputType.number,
                  //     inputFormatters: [
                  //       LengthLimitingTextInputFormatter(1),
                  //       FilteringTextInputFormatter.digitsOnly,
                  //     ],
                  //     onChanged: (value) => {
                  //       if (value.length == 1)
                  //         {FocusScope.of(context).nextFocus()}
                  //       else if (value.length == 0)
                  //         {FocusScope.of(context).previousFocus()}
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),

            // Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            // Container(
            //                       margin: EdgeInsets.symmetric(horizontal: 30),
            //                       // padding: EdgeInsets.symmetric(horizontal: 160, vertical: 12),
            //                       child: TextButton(
            //                         onPressed: () => {

            //                         },
            //                             // verifyPhoneNumber(number.text),
            //                         child: Container(
            //                           width: 500,
            //                           decoration: BoxDecoration(
            //                             color:
            //                                 Color.fromARGB(255, 205, 42, 223),
            //                             borderRadius: BorderRadius.circular(3),
            //                           ),
            //                           padding:
            //                               EdgeInsets.symmetric(vertical: 12),
            //                           // margin: EdgeInsets.symmetric(horizontal: 20),
            //                           child: widget.loading? CircularProgressIndicator() : Text("Request OTP",
            //                               textAlign: TextAlign.center,
            //                               style: GoogleFonts.poppins(
            //                                   textStyle: TextStyle(
            //                                       color: Colors.white,
            //                                       fontWeight: FontWeight.w500,
            //                                       fontSize: 16))),
            //                         ),
            //                       ),
            //                     ),
          ],
        ),
        ),);
  }
}
