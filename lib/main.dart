import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:foodapp/src/screens/home.dart';
// ignore: unused_import
import 'package:foodapp/src/screens/homescreen.dart';
import 'package:foodapp/src/screens/loginscreen.dart';
import 'package:foodapp/src/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {


  @override

  Widget build(BuildContext context) {

    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:

      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:

        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, 
              home: SplashScreen());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
              debugShowCheckedModeBanner: false,

      home: FirebaseAuth.instance.currentUser == null 
      ? LoginScreen()
      : HomePage()
          
          );
          }
      },
    );
  }
}
