import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Login/Login.dart';

class LoginController extends StatefulWidget {
  const LoginController({super.key});

  @override
  State<LoginController> createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/image1.jpg"),
                      fit: BoxFit.cover)),
            ),
            flex: 1,
          ),
          Column(
            children: [
              Flexible(
                child: Container(),
                flex: 1,
              ),
              Container(
                child: Text(
                  "V Studio",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Container(
                child: Text(
                  "Private Limited Company",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cinzel(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.normal)),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Container(
                  height: 100,
                  alignment: Alignment.centerRight,
                  child: Container(
                    // height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                    decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(300),
                            bottomLeft: Radius.circular(50))),
                    child: InkWell(
                      splashColor: Colors.purple,
                      hoverColor: Colors.purple,
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Start",
                        textAlign: TextAlign.right,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    )
        // Column(
        //   children:[
        //     Expanded(
        //       child: Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           Container(
        //             height: 150,
        //             color: const Color.fromARGB(255, 159, 11, 0),
        //             alignment: Alignment.bottomRight,
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // )
        );
  }
}
