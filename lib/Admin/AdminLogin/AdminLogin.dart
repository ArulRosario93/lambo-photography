import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Admin/AdminOrders/AdminOrders.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController pass = TextEditingController();

  handleSubmit() {
    print(pass.text);
    print(dotenv.env["ADMIN_PASS"]);

    if (pass.text == dotenv.env["ADMIN_PASS"]) {
      print("came here");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AdminOrders(),
          ));
    }
  }

  handleLoad() async {
    await dotenv.load();
  }

  @override
  void initState() {
    super.initState();
    handleLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        elevation: 0.6,
        title: Text(
          "Administrator Login",
          style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.black)),
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 28)),
                Text(
                  "V Studio Company Private Limited",
                  style: GoogleFonts.poppins(fontSize: 20),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: pass,
                    decoration: InputDecoration(
                      hintText: "Password",
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      hintStyle: GoogleFonts.cinzel(
                          textStyle: TextStyle(color: Colors.black87)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black), //<-- SEE HERE
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: InkWell(
                    onTap: () => handleSubmit(),
                    child: Text(
                      "View Orders",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
