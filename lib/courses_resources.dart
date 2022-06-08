import 'package:flutter/material.dart';

class Course {
  final String title;
  final String author;
  final String cover;

  const Course({
    @required this.author,
    @required this.title,
    @required this.cover,
  });
}

final shelf = const <Course>[
  Course(
    title: 'UI/UX on Figma',
    author: 'by Christopher D.',
    cover: 'images/figmaCourse.png',
  ),
  Course(
    title: 'Flutter workshop',
    author: 'by Katalina C.',
    cover: 'images/flutterCourse.png',
  ),
  Course(
    title: 'Atlassian',
    author: 'by Florian H.',
    cover: 'images/atlasCourse.png',
  ),
];
