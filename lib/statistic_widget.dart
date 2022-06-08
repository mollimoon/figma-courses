import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticWidget extends StatelessWidget {
  final String indicator;
  final String caption;

  const StatisticWidget({
    @required this.caption,
    @required this.indicator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      // color: Color(0xffF5F5F7),
      decoration: BoxDecoration(
        color: Color(0xffF2F0F9),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            indicator,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              fontSize: 46,
            ),
          ),
          Text(
            caption,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
