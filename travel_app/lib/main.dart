import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/accelerometer/accelerometer.dart';
import 'package:travel_app/compass/compass.dart';
import 'package:travel_app/geolocator/geolocation.dart';
import 'package:travel_app/getstarted.dart';
import 'package:travel_app/home_page.dart';
import 'package:travel_app/liked.dart';
import 'package:travel_app/recommended.dart';
import 'package:travel_app/settings.dart';
import 'package:travel_app/theme/theme_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => HomePage(selectedPreferences: [],),
        '/liked_places': (context) => LikedPage(),
        '/settings': (context) => Settings(),
        '/compass': (context) => Compass(),
        '/accelerometer':(context) => AccelerometerWidget(),
        '/geolocation' : (context) => Geolocation(),
        '/recommended' : (context) => Recommended(),
      },
      home: GetStarted(),
    );
  }
}