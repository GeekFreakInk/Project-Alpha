import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localization.dart';

import 'package:studybuddy_mobile/screens/home/homePage.dart';
import 'package:studybuddy_mobile/screens/home/notification.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/studyBuddy.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/privateLessons.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/userFeedback.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/settings.dart';
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
        '/settings' : (context) => Settings(),
        '/feedback' : (context) => UserFeedback(),
        '/studyBuddy' : (context) => StudyBuddy(),
        '/privateLessons' : (context) => PrivateLessons(),
        },
        /*
        supportedLocales: [
          const Locale('en', 'US'), // English
          const Locale('nb', 'NO'), // Norwegian
          //const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        ],
        localizationsDelegates: [
          //AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],  
        localeResolutionCallback: (locale, supportedLocales){
            if (locale != null){
              for (var supportedLocale in supportedLocales){
              if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode){
                return supportedLocale;
              } 
            }
            return supportedLocales.first;
          }
        },
        */
      ),
    );
  }
}