import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingItems/BillingItems.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingSummary/BillingSummary.dart';
import 'package:login_screen/Widgets/BillingScreen/DateTimeSelection/DateTimeSelection.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/Widgets/LocationPage/LocationPage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:login_screen/Widgets/Account/AccountPoints.dart';
import 'package:login_screen/Widgets/TermsNConditions/TermsNConditions.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen(
      {super.key,
      required this.name,
      required this.snap,
      required this.date,
      required this.image,
      this.type,
      required this.price,
      required this.description});

  final List date;
  final String name;
  final String description;
  final snap;
  final type;
  final image;
  final price;

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  bool locationSubmit = false;
  String Location = "";
  Razorpay razorpay = Razorpay();
  
  var paymentID = "";
  var orderID = "";
  var dropdownValue = "Offline";

  var points = AccountPoints;
  bool amountPayed = false;

  void handleLocation(String location, context) {
    setState(() {
      Location = location;
      locationSubmit = true;
    });
    Navigator.pop(context);
  }

  handleLoad() async{
      await dotenv.load();
  }

  @override
  void initState() {
    super.initState();
    handleLoad();
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccessResponse);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWalletSelected);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    void createRazorpayOrder() async {
      final String? apiKey = dotenv.env['API_KEY'];
      final String? apiSecret = dotenv.env['API_SECRET'];;

      final String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));

      final String apiUrl = 'https://api.razorpay.com/v1/orders';

      final Map<String, dynamic> requestData = {
        "amount": 400000.00,
        "currency": "INR",
        "receipt": "rcptid_11"
      };

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = json.decode(response.body);

        // Extract the 'id' field and set it in your state variable
        setState(() {
          orderID = responseData['id'];
        });
        var options = {
          'key': dotenv.env['API_KEY'],
          'amount': 400000,
          'name': 'V Studio',
          'order_id': responseData['id'], // Generate order_id using Orders API
          'description': 'Shoot Bookins',
          'timeout': 120,
          'prefill': {'contact': FirebaseAuth.instance.currentUser!.phoneNumber, 'email': 'test@razorpay.com'},
        };

        try {
          razorpay.open(options);
        } catch (e) {
          debugPrint(e as String?);
        }
      } else {
        // Request failed, handle the error
        print('Request failed with status code ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    }

    final Email send_email = Email(
      body: 'body of email',
      subject: 'subject of email',
      recipients: ['itsarrowhere380@gmail.com'],
      // cc: ['example_cc@ex.com'],
      // bcc: ['example_bcc@ex.com'],
      // attachmentPaths: ['/path/to/email_attachment.zip'],
      isHTML: false,
    );

    handleMail() async {
      var data = {
        "Date": widget.date,
        "PhoneNumber": FirebaseAuth.instance.currentUser!.phoneNumber,
        "Payment": "Online 4000",
        "PaymentID": paymentID,
        "OrderID": orderID,
        "Shoot": widget.name,
        "type": widget.type,
        "location": Location,
      };

      await FirebaseFirestore.instance.collection("orders").doc().set(
        data,
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        foregroundColor: const Color.fromARGB(206, 0, 0, 0),
        elevation: 0.6,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text("Book your Slot",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 15, color: Colors.black))),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Expanded(
            child: Column(
          children: [
            DateTimeSelection(date: widget.date),
            BillingItems(
              snap: widget.snap,
              image: widget.image,
              price: widget.price,
              type: widget.type,
            ),
            BillingSummary(price: widget.price),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                  ],
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsNConditions(
                            snap: points["termsandconditions"]),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Terms & Conditions",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 0, 42, 115))),
                          ),
                          // Divider(color: Colors.white,),
                          Text(
                            "Last Updated On Sep 2023",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black45)),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Color.fromARGB(255, 0, 42, 115),
                      )
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                  ],
                ),
                child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsNConditions(
                            snap: points["refundpolicy"],
                          ),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Refund Policy",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 0, 42, 115))),
                            ),
                            // Divider(color: Colors.white,),
                            Text(
                              "Last Updated On Sep 2023",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black45)),
                            )
                          ],
                        ),
                        Icon(
                          Icons.arrow_right_sharp,
                          color: Color.fromARGB(255, 0, 42, 115),
                        )
                      ],
                    ))),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                  ],
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsNConditions(
                          snap: points["privacypolicy"],
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Privacy Policy",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 0, 42, 115))),
                          ),
                          // Divider(color: Colors.white,),
                          Text(
                            "Last Updated On Sep 2023",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black45)),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Color.fromARGB(255, 0, 42, 115),
                      )
                    ],
                  ),
                )),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12, blurRadius: 10, spreadRadius: 1)
                  ],
                  // border: Border.all(color: Colors.black45,)
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsNConditions(
                          snap: points["contactus"],
                        ),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Us",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 0, 42, 115))),
                          ),
                          // Divider(color: Colors.white,),
                          Text(
                            "Last Updated On Sep 2023",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black45)),
                          )
                        ],
                      ),
                      Icon(
                        Icons.arrow_right_sharp,
                        color: Color.fromARGB(255, 0, 42, 115),
                      )
                    ],
                  ),
                )),
            const Padding(padding: EdgeInsets.only(bottom: 90))
          ],
        )),
      )),
      bottomSheet: Container(
          height: locationSubmit ? 102 : 72,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Column(children: [
            locationSubmit
                ? Container(
                    height: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 255, 17, 0),
                            ),
                            Container(
                              width: 200,
                              child: Text(
                                Location,
                                style: GoogleFonts.poppins(),
                              ),
                            )
                          ],
                        ),
                        Container(
                          child: Text(
                            "Change",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 17, 0))),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: amountPayed
                      ? Text(
                          "Payed",
                          style: GoogleFonts.poppins(),
                        )
                      : DropdownButton(
                          value: dropdownValue,
                          onChanged: (value) => setState(() {
                            dropdownValue = value!;
                          }),
                          items: [
                            DropdownMenuItem(
                                value: "Online",
                                child: InkWell(
                                    onTap: () => createRazorpayOrder(),
                                    child: Text(
                                      "Pay Advance",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black),
                                    ))),
                            DropdownMenuItem(
                              value: "Offline",
                              child: Text(
                                "Offline",
                                style: GoogleFonts.poppins(),
                              ),
                            )
                          ],
                        ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 255, 17, 0),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 195, 177, 177),
                            blurRadius: 16,
                            spreadRadius: 1)
                      ]),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      height: 30,
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      child: locationSubmit
                          ? InkWell(
                              onTap: () {
                                handleMail();
                              },
                              child: Text(
                                "Book Slot",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15)),
                              ),
                            )
                          : Container(
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LocationPage(
                                          handleLocation: handleLocation),
                                    )),
                                child: Text(
                                  "Event Location",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15)),
                                ),
                              ),
                            )),
                )
              ],
            ),
          ])),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */

    print("Called handlePaymentErrorResponse");
    print("Called handlePaymentErrorResponse");
    print("Called handlePaymentErrorResponse");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

    setState(() {
      paymentID = response.paymentId!;
      orderID = response.orderId!;
    });

    // response.paymentId

    setState(() {
      amountPayed = true;
    });

    print("Called handlePaymentSuccessResponse");
    print("Called handlePaymentSuccessResponse");
    print("Called handlePaymentSuccessResponse");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    //Do Nothing For Now
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
