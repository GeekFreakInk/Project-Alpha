import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';

class SignIn extends StatefulWidget {

  // accept toggleView from authenticate.dart
  final Function toggleView;

  SignIn({this.toggleView}); // constructor

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey =
      GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'epost',
                ),
                validator: (value) => value.isEmpty ? 'ugyldig epost' : null,
                
                onChanged: (value) {
                  setState(() => email = value);
                },
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Passord',
                ),
                validator: (value) =>
                    value.length < 6 ? 'ugyldig password' : null,
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                },
              ),
              RaisedButton(
                child: Text('sign in'),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() => error = 'sign in failed');
                    }
                  }
                },

              ),
              GestureDetector (
                onTap: () {
                  widget.toggleView();
                },
                child: Text('register', style: TextStyle( decoration: TextDecoration.underline),)
                ),

              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
