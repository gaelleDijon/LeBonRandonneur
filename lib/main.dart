import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_randonneur/screens/onboarding.dart';
import 'package:page_transition/page_transition.dart';
import 'controller/permission_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // PermissionHelper().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Le Bon randonneur",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: const Color.fromARGB(255, 14, 115, 78),
        primaryColor: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.white,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            // color: Color(0xFF100E34),
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            color: const Color(0xFF100E34).withOpacity(0.5),
          ),
        ),
      ),
      home: AnimatedSplashScreen(
        duration: 2000,
        nextScreen: const Onboarding(),
        splash: Image.asset('assets/logo_white.png'),
        splashIconSize: 150.0,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.teal,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}
