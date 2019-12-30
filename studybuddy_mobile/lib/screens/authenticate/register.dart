import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';

class Register extends StatefulWidget {
  // accept toggleView from authenticate.dart
  final Function toggleView;
  Register({this.toggleView}); // constructor

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  final _formKey =
      GlobalKey<FormState>(); // Identify the form. Allow validation

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign up'),
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
                  setState(() => email = value.trim());
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
                  setState(() => password = value.trim());
                },
              ),
              RaisedButton(
                child: Text('register'),
                onPressed: () async {
                  // do validation based on validator properties
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() => error = 'an error message');
                    }
                    // if result != null: direct to homepage automatically
                  }
                },
              ),
               
               GestureDetector(
                  onTap: () {
                    widget.toggleView();
                  },
                  child: Text(
                    'signn in',
                    style: TextStyle(decoration: TextDecoration.underline),
                  )),
              Text(error),
            ],
          ),
        ),
      ),
    );
  }
}
