import 'package:flutter/material.dart';


ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6200EE), 
    background: Colors.white, 
    onBackground: Colors.black, 
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.black, 
    displayColor: Colors.black, 
  ),
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF3700B3), 
    background: Color.fromARGB(114, 0, 0, 0), 
    onBackground: Colors.white, 
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
).copyWith(
  scaffoldBackgroundColor: Color.fromARGB(255, 24, 24, 24),
);
