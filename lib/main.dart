import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:motos_strapi_v1/pages/inicio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'version 1',
      home: HomePage(),
    );
  }
}

