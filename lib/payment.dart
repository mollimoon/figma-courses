import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_widget.dart';
import 'card_number_formatter.dart';
import 'date_number_formatter.dart';
import 'card_style.dart';

class CardPayment extends StatefulWidget {
  @override
  _CardPaymentState createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  final TextEditingController _nameTec =
      TextEditingController(); //инициализация контроллера текста
  final TextEditingController _cardTec =
      TextEditingController(); //инициализация контроллера текста
  final TextEditingController _dateTec =
      TextEditingController(); //инициализация контроллера текста

  String _name = 'CARDHOLDER';
  String _card = '0000 0000 0000 0000';
  String _date = '00/00';

  @override
  void initState() {
    super.initState();

    _nameTec.addListener(() {
      //слушает что пишет и обновляет
      setState(() {
        _name = _nameTec.text;
      });
    });

    _cardTec.addListener(() {
      setState(() {
        _card = _cardTec.text;
      });
    });

    _dateTec.addListener(() {
      setState(() {
        _date = _dateTec.text;
      });
    });
  }

  @override
  void dispose() {
    _nameTec.dispose(); //чтобы не было утечки
    _cardTec.dispose();
    _dateTec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              AppBar(
                title: Text(
                  'Credit / Debit Card',
                  style: GoogleFonts.poppins(
                    color: Color(0xff07122A),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                automaticallyImplyLeading: false,
                leading: Navigator.canPop(context)
                    ? IconButton(
                        icon: Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Color(0xFFdadcdf),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    : null,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  Image.asset(
                    'images/card.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    child: Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 85, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardStyle(text: _card, size: 26.0),
                            SizedBox(
                              height: 45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CardStyle(text: _name, size: 20.0),
                                SizedBox(
                                  width: 58,
                                ),
                                CardStyle(text: _date, size: 20.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Image.asset(
                'images/takePhoto.png',
                height: 30,
              ),
              SizedBox(
                height: 13,
              ),
              PaymentWidget(
                controller: _nameTec,
                textF: 'Name on card',
                maxLength: 10,
                keyboardType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[A-Z ]')),
                ],
              ),
              SizedBox(
                height: 17,
              ),
              PaymentWidget(
                controller: _cardTec,
                textF: 'Card number',
                maxLength: 19,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CardNumberFormatter(),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  Flexible(
                    child: PaymentWidget(
                      controller: _dateTec,
                      maxLength: 5,
                      textF: 'Expiry date',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        DateNumberFormatter(),
                      ],
                    ),
                  ),
                  SizedBox(width: 19),
                  Flexible(
                    child: PaymentWidget(
                      obscure: true,
                      textF: 'CVC',
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      maxLength: 3,
                      image: 'images/Hint.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Use this card',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFFFFFFF),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF07122A),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.only(top: 17, bottom: 17, left: 56, right: 56),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
