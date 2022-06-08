import 'package:figma_courses/courses.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class GreetingScreen extends StatefulWidget {
  GreetingScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Image.asset('images/bust.png',
              height: 376,
              width: 278,),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 33),
              child: Text("Hey Leslee,\nthere\'s a new course about\nFigma",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Color(0xFF07122A),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 37, right: 33, top: 11),
              child: Text(
                "Find out how our new matching tool can help you learn another way",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Color(0xFF4F4F4F),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Courses(),), //переход на др стр
                );
              },
              child: Text(
                'Discover the course',
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
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
              },
              child: Text("Not Now",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 15,
                ),),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}