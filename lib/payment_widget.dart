import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentWidget extends StatelessWidget {
  final TextEditingController controller;
  final String textF;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLength;
  final String image;
  final bool obscure;

  const PaymentWidget({
    @required this.textF,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.image,
    this.controller,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textF,
          style: GoogleFonts.poppins(
            color: Color(0XFF8698A8),
            fontSize: 14,
          ),
        ),
        TextField(
          controller: controller,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscure,
          decoration: InputDecoration(
            suffixIcon: image == null
                ? null
                : Padding(
                  padding: const EdgeInsets.only(right: 9),
                  child: SizedBox(
                      height: 26,
                      width: 31,
                      child: Image.asset(image),
                    ),
                ),
            counter: Offstage(), //hide counter of numberLength
            fillColor: Color(0XFF8698A8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.0),
            ),
          ),
        ),
      ],
    );
  }
}
