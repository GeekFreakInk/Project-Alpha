import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticated/settings/adminPanel/adminPanel.dart';
import 'package:studybuddy_mobile/screens/authenticated/settings/adminPanel/usermanagment/users/allUsers.dart';
import 'package:studybuddy_mobile/screens/authenticated/profileSetup/registerUser.dart';
import 'routeConstants.dart';
import 'package:studybuddy_mobile/screens/authenticated/home/notification.dart';
import 'package:studybuddy_mobile/screens/authenticated/studyBuddy/studyBuddy.dart';
import 'package:studybuddy_mobile/screens/authenticated/privateLessons/privateLessons.dart';
import 'package:studybuddy_mobile/screens/authenticated/feedback/userFeedback.dart';
import 'package:studybuddy_mobile/screens/authenticated/settings/settings.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/widgetsRepository.dart';
import 'package:studybuddy_mobile/screens/authenticated/wrapper.dart';
import 'package:studybuddy_mobile/screens/authenticated/home/homePage.dart';
import 'package:studybuddy_mobile/screens/authenticated/webViews/Math/explore_math.dart';

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
        return MaterialPageRoute(builder: (_) => SettingsPage());
      case adminPanelRoute:
        return MaterialPageRoute(builder: (_) => AdminPanel());
      case widgetsRepositoryRoute:
        return MaterialPageRoute(builder: (_) => Widgets());
      case feedbackRoute:
        return MaterialPageRoute(builder: (_) => UserFeedback());
      case studyBuddyRoute:
        return MaterialPageRoute(builder: (_) => StudyBuddy());
      case privateLessonsRoute:
        return MaterialPageRoute(builder: (_) => PrivateLessons());

      case registerUserRoute:
        return MaterialPageRoute(builder: (_) => RegisterUser());

      case usersRoute:
        return MaterialPageRoute(builder: (_) => AllUsers());


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
  

  
