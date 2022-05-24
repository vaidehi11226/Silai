import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:silaiproject/admin_screen/Mesurements/FemaleMeasurements.dart';
import 'package:silaiproject/screen_user/Loginscreen.dart';
import 'package:silaiproject/screen_user/homepage.dart';
import 'package:silaiproject/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silai Login page',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(
          'images/Silai.png',
          height: 1000,
          width: 1000,
        ),
        nextScreen: FemaleMesure(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white,
        duration: 800,
      ),
    );
  }
}
