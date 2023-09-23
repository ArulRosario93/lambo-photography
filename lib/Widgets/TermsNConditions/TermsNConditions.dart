import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsNConditions extends StatelessWidget {
  const TermsNConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 29, 78),
        title: Text("Back", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.w500,)),),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(padding: EdgeInsets.symmetric(vertical: 10),),
              Text("Terms & Conditions", style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Color.fromARGB(255, 0, 29, 78))),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                width: 20,
                child: Divider(color: Color.fromARGB(255, 0, 29, 78), thickness: 5.0,),
              ),
              Text("Last Updated On Sep 2023", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 0, 42, 115))),),

              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

              Text("If the onChanged callback is null or the list of items is null then the dropdown button will be disabled, i.e. its arrow will be displayed in grey and it will not respond to input. A disabled button will display the disabledHint widget if it is non-null. However, if disabledHint is null and hint is non-null, the hint widget will instead be displayed.", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(199, 0, 0, 111))),),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

              Text("If the onChanged callback is null or the list of items is null then the dropdown button will be disabled, i.e. its arrow will be displayed in grey and it will not respond to input. A disabled button will display the disabledHint widget if it is non-null. However, if disabledHint is null and hint is non-null, the hint widget will instead be displayed.", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(199, 0, 0, 111))),),
            
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text("We use this App is subject to the following terms of use:", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 6, 0, 110), fontWeight: FontWeight.w600)),),     
            
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.circle,size: 12, color: Colors.black,),
                    horizontalTitleGap: 0.0,
                    title: Text("If the onChanged callback is null or the list of items is null then the dropdown button will be disabled, i.e. its arrow will be displayed in grey and it will not respond to input. A disabled button will display the disabledHint widget if it is non-null. However, if disabledHint is null and hint is non-null", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 6, 0, 110))),),    
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,size: 12, color: Colors.black,),
                    horizontalTitleGap: 0.0,
                    title: Text("If the onChanged callback is null or the list of items is null then the dropdown button will be disabled, i.e. its arrow will be displayed in grey and it will not respond to input. A disabled button will display the disabledHint widget if it is non-null. However, if disabledHint is null and hint is non-null", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 6, 0, 110))),),    
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.circle,size: 12, color: Colors.black,),
                    horizontalTitleGap: 0.0,
                    title: Text("We use this App is subject to the following terms of use:", style: GoogleFonts.poppins(textStyle: TextStyle(color: Color.fromARGB(255, 6, 0, 110))),),    
                    titleTextStyle: GoogleFonts.poppins(color: Colors.black),
                  ),
                ],
              )
            ]
          ),
        )
      )
    );
  }
}