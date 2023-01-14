import 'package:flutter/material.dart';
import 'package:resepkita/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor mycolor = MaterialColor(
    0xFFF6BE85,
    <int, Color>{
      50: Color(0xFFF6BE85),
      100: Color(0xFFF6BE85),
      200: Color(0xFFF6BE85),
      300: Color(0xFFF6BE85),
      400: Color(0xFFF6BE85),
      500: Color(0xFFF6BE85),
      600: Color(0xFFF6BE85),
      700: Color(0xFFF6BE85),
      800: Color(0xFFF6BE85),
      900: Color(0xFFF6BE85),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Resep Kita',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primarySwatch: mycolor,
          primaryColor: Colors.white,
          textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.white),
          ),
        ),
        home: HomePage());
  }
}
