import 'package:flutter/material.dart';
import 'package:roadmap_create_pagee/pages/%C2%A0%20%20horizontal_home.dart';
import 'package:roadmap_create_pagee/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const NewHome(),
    );
  }
}

