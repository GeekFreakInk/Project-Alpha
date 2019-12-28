import 'package:flutter/material.dart';

class Notis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifikasjon'),
        ),
        body: Container(
            child: Center(
          child: Text('Notifikasjon'),
        ))
        );
  }
}
