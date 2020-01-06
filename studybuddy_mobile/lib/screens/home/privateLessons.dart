import 'package:flutter/material.dart';

class PrivateLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Privatundervisning'),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du kjøpe privatundervisning'),
        ))
        );
  }
}