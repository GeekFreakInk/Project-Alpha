import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'screens/userProfile.dart';
import 'screens/homePage.dart';
import 'screens/notification.dart';

void main() => runApp(MobileApp());

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
        '/profile': (context) => Profile(),
        '/notis': (context) => Notis(),
      }
    );
  }
}





