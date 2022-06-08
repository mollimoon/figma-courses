import 'package:figma_courses/statistic_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'courses_resources.dart';
import 'payment.dart';
import 'statistic_widget.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  int _selectedIndex = 0; //icons index
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Your courses',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: shelf.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          width: 135.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('${shelf[index].cover}'),
                          )),
                        ),
                      ),
                      Text(
                        '${shelf[index].title}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '${shelf[index].author}',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Personal statistics',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StatisticWidget(
                          indicator: '11',
                          caption: 'Courses completed',
                        ),
                        StatisticWidget(
                          indicator: '3',
                          caption: 'Courses in progress',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 21, top: 46), //change to sizebox
                    child: Text(
                      'Learn more way faster',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CardPayment(),
                        ), //переход на др стр
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Go Pro Now  ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 4,
                          ),
                          child: Text(
                            '  and save 80%',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xFF07122A),
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.only(top: 18, bottom: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          currentIndex: _selectedIndex, // icons choose
          onTap: _onItemTapped,
          selectedItemColor: Colors.white,
          backgroundColor: Color(0xFF07122A),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_box_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.view_carousel_outlined,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.insert_photo_outlined,
                size: 30,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //для обновления свойств иконок
    });
  }
}
