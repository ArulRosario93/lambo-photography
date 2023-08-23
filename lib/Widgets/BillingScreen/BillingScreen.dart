import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingItems/BillingItems.dart';
import 'package:login_screen/Widgets/BillingScreen/BillingSummary/BillingSummary.dart';
import 'package:login_screen/Widgets/BillingScreen/CancellationPolicy/CancellationPolicy.dart';
import 'package:login_screen/Widgets/BillingScreen/DateTimeSelection/DateTimeSelection.dart';
import 'package:login_screen/Widgets/BillingScreen/PersonalDetails/PersonalDetails.dart';
import 'package:http/http.dart' as http;
import 'package:login_screen/Widgets/LocationPage/LocationPage.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen(
      {super.key,
      required this.name,
      required this.snap,
      required this.date,
      required this.time,
      required this.image,
      required this.description});

  final List date;
  final String name;
  final String description;
  final snap;
  final image;
  final time;

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  bool locationSubmit = false;
  String Location = "";

  void handleLocation(String location, context) {
    print("Called");
    setState(() {
      Location = location;
      locationSubmit = true;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    displayPaymentSheet() async {
      try {
        await Stripe.instance.presentPaymentSheet().then((value) {
          print("Payment Successfully");
        });
      } catch (e) {
        print('$e');
      }
    }

    createPaymentIntent(String amount, String currency) async {
      try {
        Map<String, dynamic> body = {
          'amount': amount,
          'currency': currency,
        };

        var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          headers: {
            'Authorization':
                'Bearer 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',
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: body,
        );
        return json.decode(response.body);
      } catch (err) {
        throw Exception(err.toString());
      }
    }

    Future<void> makePayment() async {
      print("Processsing");
      try {
        var paymentIntent = await createPaymentIntent('10000', 'INR');

        var gpay = const PaymentSheetGooglePay(
            merchantCountryCode: "IN", currencyCode: "IN");

        //STEP 2: Initialize Payment Sheet
        await Stripe.instance
            .initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
                    paymentIntentClientSecret: paymentIntent![
                        'client_secret'], //Gotten from payment intent
                    style: ThemeMode.light,
                    merchantDisplayName: 'Lambo Photography',
                    googlePay: gpay))
            .then((value) {});

        //STEP 3: Display Payment sheet
        displayPaymentSheet();
      } catch (err) {
        print("Error during payment: $err");
      }
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
            DateTimeSelection(date: widget.date, time: widget.time),
            BillingItems(
              snap: widget.snap,
              image: widget.image,
            ),
            BillingSummary(price: widget.snap["price"]),
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
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 17, 0))),
                    onPressed: () => makePayment(),
                    child: Text(
                      "Pay 10",
                      style: GoogleFonts.poppins(),
                    ),
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
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
                              // height: 40,
                              // alignment: Alignment.center,
                              // padding: EdgeInsets.symmetric(vertical: 5),
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
}
