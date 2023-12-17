import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homepage.dart';

void main(){
  runApp(const Hangman());
}
class Hangman extends StatelessWidget {
  const Hangman({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.lalezarTextTheme()
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
