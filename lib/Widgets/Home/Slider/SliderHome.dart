import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 5)),
        Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
              child: Text("Sessions Taken", textAlign: TextAlign.left, style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w400)),),
            ),
            CarouselSlider(
              items: [
                Container(
                  height: 80,
                  margin: EdgeInsets.only(right: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amberAccent,
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://img.freepik.com/free-photo/happy-family-outdoors-spending-time-together_1328-2486.jpg"))),
                ),
              Container(
                height: 80,
                margin: EdgeInsets.only(right: 18, left: 9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amberAccent,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://e1.pxfuel.com/desktop-wallpaper/417/521/desktop-wallpaper-babies-posted-by-zoey-cunningham-baby-girl.jpg"))),
              ),
              Container(
                height: 80,
                margin: EdgeInsets.only(left: 9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amberAccent,
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://photographypro.com/wp-content/uploads/2020/06/Children-Photography-56.jpg"))),
              ),
            ],
            options: CarouselOptions(
              height: 120.0,
              enlargeCenterPage: false,
              pageSnapping: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 6),
              aspectRatio: 16 / 5,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: false,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
      ],
    );
  }
}