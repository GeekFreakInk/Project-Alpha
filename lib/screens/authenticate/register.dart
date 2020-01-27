import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';
import '../../services/usersAPI.dart';

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
      body: Padding(
        padding: EdgeInsets.all(20),
              child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email',
                  ),
                  validator: (value) => value.isEmpty ? 'ugyldig epost' : null,
                  onChanged: (value) {
                    setState(() => email = value.trim());
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'password',
                  ),
                  validator: (value) =>
                      value.length < 6 ? 'ugyldig password' : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() => password = value.trim());
                  },
                ),
                SizedBox(height: 20,),
                RaisedButton(
                  child: Text('register'),
                  onPressed: () async {
                    // do validation based on validator properties
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'registration failed');
                      }else{
                        
                        registerUser(result);
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
                      'sign in',
                      style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                    )),
                Text(error),
              ],
            ),
          ),
        ),
      ),
    );
  } 
}
