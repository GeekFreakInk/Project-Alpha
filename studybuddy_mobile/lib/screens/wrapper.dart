
import 'package:provider/provider.dart';
import 'package:studybuddy_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticate/authenticate.dart';
import 'package:studybuddy_mobile/screens/home/userProfile.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    
    // check if we have a valid user, return different widget according to that
    if (user == null) {
      return Authenticate();
    } else {
      return Profile();
    }
    
  }
}