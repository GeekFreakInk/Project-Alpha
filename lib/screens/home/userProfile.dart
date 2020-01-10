import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';

class Profile extends StatelessWidget {

  final AuthService _auth = AuthService(); // Allow access to signOut() method from auth.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('min profil'),
      ),
      body: Container(
          child: Center(
        child: RaisedButton(
          child: Text('log ut'),
          onPressed: () async {
            await _auth.signOut();
          },
        ),
      )),
    );
  }
}
