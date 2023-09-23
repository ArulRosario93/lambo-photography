import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Home/Home.dart';
import 'package:login_screen/Widgets/TermsNConditions/TermsNConditions.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {

  _onItemTapped(int num) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ));
    }

    return Scaffold(
      body: Column(
          children: [
            Container(
              color: Color.fromARGB(255, 255, 255, 255),
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 250,
                          decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover, image: NetworkImage("https://i0.wp.com/blog.photoshelter.com/wp-content/uploads/2023/04/national-photo-month-blog-cover.jpg?resize=350%2C200&ssl=1")
                            )
                          ), 
                        ), Container(
                          height: 250,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Text("We Are V Studio", style: GoogleFonts.poppins(color: Colors.white, fontSize: 22),),
                        )
                      ]
                    )
                  ),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(26, 104, 104, 104)
                  ),
                  child: InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder:(context) => TermsNConditions(),)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Terms & Conditions", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color.fromARGB(255, 0, 42, 115))),),
                          // Divider(color: Colors.white,),
                          Text("Last Updated On Sep 2023", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black45)),)
                        ],
                      ),
                  )
                ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  Container(
                    child: Column(
                      children: [
                        Text("Contect Us", style: GoogleFonts.poppins(),)
                      ],
                    ),
                  )
                ]
              )
            )
          ],
        ),
        bottomSheet: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
            label: 'Account',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Color.fromARGB(255, 255, 0, 0),
        onTap: _onItemTapped,
      ),);
  }
}