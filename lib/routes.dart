import 'package:flutter/material.dart';
import 'shared/constants.dart';
import 'package:studybuddy_mobile/screens/home/notification.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/studyBuddy.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/privateLessons.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/userFeedback.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/settings.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetsRepository.dart';
import 'package:studybuddy_mobile/screens/wrapper.dart';
import 'package:studybuddy_mobile/screens/home/homePage.dart';

import 'package:studybuddy_mobile/screens/navigationScreens/exploreWidgets/explore_math.dart';

class Router {
  //Main routes -- first layer
  static Route<dynamic> generateMainRoute(RouteSettings settings) {
    switch (settings.name){
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => Wrapper());
      case notisRoute:
        return MaterialPageRoute(builder: (_) => Notis());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => Settings());
      case widgetsRepositoryRoute:
        return MaterialPageRoute(builder: (_) => Widgets());
      case feedbackRoute:
        return MaterialPageRoute(builder: (_) => UserFeedback());
      case studyBuddyRoute:
        return MaterialPageRoute(builder: (_) => StudyBuddy());
      case privateLessonsRoute:
        return MaterialPageRoute(builder: (_) => PrivateLessons());


      case mathRoute:
        return MaterialPageRoute(builder: (_) => ExploreMath());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        )
      );
    }
  }
  
  //static Route<dynamic> generateSettingsRoute(RouteSettings settings) {  }
  /* static Route<dynamic> generateExploreRoute(RouteSettings settings) { 
    switch (settings.name){
      case mathRoute:
        return MaterialPageRoute(builder: (_) => Explore_Math());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ));
    }
  } */
}
  

  
