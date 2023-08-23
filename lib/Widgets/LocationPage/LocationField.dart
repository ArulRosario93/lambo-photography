import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationField extends StatefulWidget {
  const LocationField({super.key, required this.handleLocation});

  final handleLocation;

  @override
  State<LocationField> createState() => _LocationFieldState();
}

class _LocationFieldState extends State<LocationField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 270,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 80,
      child: TextFormField(
        onFieldSubmitted: (value) => widget.handleLocation(controller.text, context),
        style: GoogleFonts.poppins(
            textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
          helperText: "Event Location",
            contentPadding: const EdgeInsets.all(5),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}