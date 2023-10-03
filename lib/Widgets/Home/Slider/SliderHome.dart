import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Home/Slider/SliderNow/SliderNow.dart';
import 'package:shimmer/shimmer.dart';

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
                  child: InkWell(
                    child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Shimmer.fromColors(baseColor:Color.fromARGB(255, 241, 241, 241), highlightColor: Color.fromARGB(255, 255, 248, 248), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height:100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),),
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/marriageShoot1.jpg"
                          )
                          )
                        ),
                      ),
                    ],
                  ),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => const SliderNow(name: "Marriage Shoot", image: "assets/marriageShoot1.jpg")),
                  ),
                ),
                Container(
                  height: 80,
                  child: InkWell(
                    child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Shimmer.fromColors(baseColor:Color.fromARGB(255, 241, 241, 241), highlightColor: Color.fromARGB(255, 255, 248, 248), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height:100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),),
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/marriageShoot2.jpg"
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                    onTap: () => showDialog(
                                    context: context,
                                    builder: (context) => const SliderNow(name: "Marriage Shoot", image: "assets/marriageShoot2.jpg"))
                  ),
                ),
                Container(
                  height: 80,
                  child: InkWell(
                    child: Stack(
                    fit: StackFit.expand,
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      Shimmer.fromColors(baseColor:Color.fromARGB(255, 241, 241, 241), highlightColor: Color.fromARGB(255, 255, 248, 248), child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 250,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              height:100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                          ],
                        ),),
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(right: 18),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/marriageShoot3.jpg"
                            )
                          )
                        ),
                      ),
                    ],
                  ),
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => const SliderNow(name: "Marriage Shoot", image: "assets/marriageShoot3.jpg"))
                  )
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