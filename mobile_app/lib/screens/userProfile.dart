import 'package:flutter/material.dart';
import 'login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('min profil'),
      ),
      body: UserProfile(),
    );
  }
}

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Future<void> _logOut() async {
    Navigator.popUntil(context, ModalRoute.withName('/login'));
    LoginPage.isLoggedIn = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: RaisedButton(
        onPressed: () {
          LoginPage.isLoggedIn // Check if user is logged in
              ? _logOut() // log out when button gets pressed
              : Navigator.pushNamed(
                  context, '/login'); // navigates to login page
        },
        child: Text(
          LoginPage.isLoggedIn ? 'Log ut' : 'Log inn',
        ),
      ),
    ));
  }
}
