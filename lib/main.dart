// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rest_api/screen/home.dart';

void main() => runApp(RestAPI());

class RestAPI extends StatelessWidget {
  const RestAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rest Api",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent.shade700,
        ),
      ),
      home: HomePage(),
    );
  }
}
