import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/ContainerBlockTemplate.dart';

class ContainerBlock extends StatelessWidget {
  const ContainerBlock(
      {super.key,
      required this.image,
      required this.images,
      required this.description,
      required this.name,
      required this.offer,
      required this.date,
      required this.shootname,
      required this.handleChange,
      required this.time,
      required this.price});

  final String image;
  final handleChange;
  final String name;
  final shootname;
  final List date;
  final String description;
  final List images;
  final int offer;
  final int price;
  final time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: ContainerBlockTemplate(
          image: image,
          date: date,
          name: name,
          shootname: shootname,
          handleChange: handleChange,
          time: time,
          images: images,
          offer: offer,
          price: price,
          description: description),
    );
  }
}
