import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Instillinger'),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du endre dine instillinger'),
        ))
        );
  }
}
