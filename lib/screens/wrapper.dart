
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybuddy_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticate/authenticate.dart';
import 'package:studybuddy_mobile/screens/home/userProfile.dart';
import 'package:studybuddy_mobile/services/auth.dart';

class _WrapperState extends State<Wrapper>{
  final AuthService _auth = AuthService(); // Allow access to signOut() method from auth.dart
  bool skipAuthentication;
  bool result;
  
  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user == null && result == null){
      checkIfShouldAuthenticate(user);
      return Scaffold(
        body: Container(alignment: Alignment.center, child: CircularProgressIndicator(),));
    }else if (user == null && result) {
      return Authenticate();
    }else if(user != null){
      return Profile();
    }else{
      return Scaffold(
        body: Container(alignment: Alignment.center, child: CircularProgressIndicator(),));
    }
  } // access user-data from the provider
    

   Future<void> checkIfShouldAuthenticate(User user) async{
     final prefs = await SharedPreferences.getInstance();
     bool isInDeebugMode =  prefs.getBool("debugMode") == null ? false : prefs.getBool("debugMode");
     bool shouldSkip = prefs.getBool("avoidLogin") == null ? false : prefs.getBool("avoidLogin"); 
     setState(() {
        skipAuthentication = shouldSkip && isInDeebugMode ? true : false; // bør skippe om alle er oppfylt
        if(skipAuthentication){
          skipLogin(user);
        }else{
          result = true;
        }
      }); // Endrer sett autentication til true eller false
  }
  Future<void> skipLogin(User user) async{
    if(user == null){
      await _auth.signInWithEmailAndPassword("hanna@admin.no", "admin123");
    }
    setState(() {
        result = true;
    });
  }
}
class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => new _WrapperState();
  
}