import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  static bool isLoggedIn = false; // referenced in userProfile.dart

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey _globalKey = GlobalKey<
      FormState>(); // Identifies the form. Allows validation in later step

  final _userName = TextEditingController(); // Username
  final _userPwd = TextEditingController(); // Password

  _logIn() {
    if (_userName.text == 'admin' && _userPwd.text == '123456') {
      LoginPage.isLoggedIn = true;

      Navigator.pushNamed(context, '/home');

      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('velkommen'),
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('feil brukernavn eller passord'),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _globalKey,
        autovalidate:
            true, // Shows error message immediately after every change
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _userName,
              decoration: InputDecoration(labelText: 'brukernavn: admin'),
              validator: (v) {
                return v.trim().length > 0 ? null : 'brukernavn er tom';
              },
            ),
            TextFormField(
              controller: _userPwd,
              decoration: InputDecoration(
                labelText: 'passord: 123456',
              ),
              validator: (v) {
                return v.trim().length > 5 ? null : 'ugyldig passord';
              },
              obscureText: true,
            ),
            SizedBox(
              child: RaisedButton(
                onPressed: _logIn,
                child: Text(
                  'Log in',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
