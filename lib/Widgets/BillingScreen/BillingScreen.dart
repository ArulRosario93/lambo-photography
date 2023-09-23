import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingItems/BillingItems.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingSummary/BillingSummary.dart';
import 'package:login_screen/Widgets/BillingScreen/CancellationPolicy/CancellationPolicy.dart';
import 'package:login_screen/Widgets/BillingScreen/DateTimeSelection/DateTimeSelection.dart';
import 'package:login_screen/Widgets/BillingScreen/PersonalDetails/PersonalDetails.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/Widgets/LocationPage/LocationPage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen(
      {super.key,
      required this.name,
      required this.snap,
      required this.date,
      required this.time,
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
  final time;
  final price;

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  bool locationSubmit = false;
  String Location = "";
  Razorpay razorpay = Razorpay();

  var dropdownValue = "Offline";

  var orderID = "";

  bool amountPayed = false;

  double total = 00;

  void handleLocation(String location, context) {
    setState(() {
      Location = location;
      locationSubmit = true;
    });
    Navigator.pop(context);
  }

  void handlegrandTotla(double price) {
    double percentVal = 2.9 / 100;

    String val = widget.price;

    int amount = int.parse(val);

    double extraAmount = percentVal * amount;

    double grandAmount = amount + 90.0 + extraAmount;
    setState(() {
      total = grandAmount;
    });
  }

  @override
  void iniState() {
    super.initState();
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
      final String apiKey = 'rzp_test_PycJvHLfpkg4vY';
      final String apiSecret = '1xsRaoiXwoHaoaDxmwBxfAw2';

      final String basicAuth =
          'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));

      final String apiUrl = 'https://api.razorpay.com/v1/orders';

      final Map<String, dynamic> requestData = {
        "amount": 15.00,
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
          'key': 'rzp_test_PycJvHLfpkg4vY',
          'amount': 15.00,
          'name': 'V Studio',
          'order_id': responseData['id'], // Generate order_id using Orders API
          'description': 'Shoot Bookins',
          'timeout': 60,
          'prefill': {'contact': '9043870363', 'email': 'test@razorpay.com'},
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

    handleChangedropFunction() {}

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
            DateTimeSelection(date: widget.date, time: widget.time),
            BillingItems(
              snap: widget.snap,
              image: widget.image,
              price: widget.price,
              type: widget.type,
            ),
            BillingSummary(price: widget.price),
            const PersonalDetails(),
            const CancellationPolicy(),
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
                  child: DropdownButton(
                    value: dropdownValue,
                    onChanged: (value) => setState(() {
                      dropdownValue = value!;
                    }),
                    items: [
                      DropdownMenuItem(
                          value: "Online",
                          child: amountPayed
                              ? Text(
                                  "Payed",
                                  style: GoogleFonts.poppins(),
                                )
                              : InkWell(
                                  onTap: () => createRazorpayOrder(),
                                  child: Text(
                                    "Pay Now",
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
                              onTap: () {},
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

    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */

    setState(() {
      amountPayed = true;
    });

    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");

    print("Called handlePaymentSuccessResponse");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
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
