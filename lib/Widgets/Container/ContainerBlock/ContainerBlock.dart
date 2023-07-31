import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_screen/Widgets/Container/ContainerBlock/ContainerBlockTemplate.dart';

class ContainerBlock extends StatelessWidget {
  const ContainerBlock({super.key, required this.image, required this.images, required this.description, required this.name, required this.offer, required this.price});

  final String image;
  final String name;
  final String description;
  final List images;
  final int offer;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: ContainerBlockTemplate(
          image: image, name: name, images: images, offer: offer, price: price, description: description),
    );
  }
}
