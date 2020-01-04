import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/home/homePage.dart';
import 'package:provider/provider.dart';
import 'package:studybuddy_mobile/screens/home/notification.dart';
import 'package:studybuddy_mobile/screens/wrapper.dart';
import 'package:studybuddy_mobile/services/auth.dart';
import 'package:studybuddy_mobile/models/user.dart';

void main() => runApp(App()); 

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value (
      value: AuthService().user, // access user-stream on instance
          child: MaterialApp(
        home: HomePage(),
        routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => Wrapper(),
        '/notis': (context) => Notis(),
        
      }
      ),
    );
  }
}