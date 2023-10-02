import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Admin/AdminOrders/OrderContainer.dart';

class AdminOrders extends StatefulWidget {
  const AdminOrders({super.key});

  @override
  State<AdminOrders> createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  var snap = [];

  void handleCalled() async {
    var snapshot = await FirebaseFirestore.instance.collection("orders").orderBy("datePublished", descending: true).get();

    setState(() {
      snap = snapshot.docs; // Access the data from the DocumentSnapshot
    });
  }

  @override
  void initState() {
    handleCalled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black54,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.6,
        title: Text(
          "Orders Placed",
          style: GoogleFonts.cinzel(textStyle: TextStyle(color: Colors.black)),
        ),
      ),
      backgroundColor: Colors.white,
      body: snap.length > 0? SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 20)),
              Text(
                "Recently",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.black45)),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              for (var i = 0; i < snap.length; i++)
                OrderContainer(
                  index: i,
                  snap: snap[i],
                )
            ],
          ),
        ),
      ): Container(
        alignment: Alignment.center,
        child: Text("Loading"),
      ),
    );
  }
}
