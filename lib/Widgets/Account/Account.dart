import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Home/Home.dart';

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

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.white,
                       boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(169, 193, 193, 193),
                          blurRadius: 30,
                          spreadRadius: 4,
                        ),
                        
                      ]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text( "Personal Informarion", style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold),),
                        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                        Row(
                          children: [
                            Container(
                              child: Text("Name: ", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),),
                            ), Container(
                              child: Text("Ramesh", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400),),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3),),
                        Row(
                          children: [
                            Container(
                              child: Text("Phone Number: ", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),),
                            ), Container(
                              child: Text("9804298149", style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w400),),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 3),)
                      ],
                    ),
                  ),

                  Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.white,
                       boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(169, 193, 193, 193),
                          blurRadius: 30,
                          spreadRadius: 4,
                        ),
                        
                      ]
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Text("Your Orders", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),),
                        Padding(padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20)),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Stack(
                                children: [
                                  Container(
                                    height: 130,
                                    width: 220,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(3)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage("https://www.babsboardwellweddings.co.uk/wp-content/uploads/2020/06/Post-Wedding-Photographer-16.jpg"))
                                    ),
                                  ),
                                  Container(
                                    height: 130,
                                    width: 180,
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                    child: Text("Marriage Shoot", style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                                  )
                                ],
                              ),
                            )
                          ]
                        )
                      ],
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