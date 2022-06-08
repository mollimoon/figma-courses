import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class CardStyle extends StatelessWidget {

  final String text;
  final double size;

  const CardStyle({
    @required this.text, @required this.size,
});

  @override
  Widget build(BuildContext context) {
    return Text( text,
      style: GoogleFonts.poppins(
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w400,
        fontSize: size,
      )
    );
  }
}
