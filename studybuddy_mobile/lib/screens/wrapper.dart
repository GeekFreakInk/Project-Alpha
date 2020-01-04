
import 'package:provider/provider.dart';
import 'package:studybuddy_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticate/authenticate.dart';
import 'package:studybuddy_mobile/screens/home/userProfile.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context); // access user-data from the provider
    print(user);
    
    // check if we have a valid user (user signed in), return different widget dependant on that
    if (user == null) {
      return Authenticate();
    } else {
      return Profile();
    }
    
  }
}