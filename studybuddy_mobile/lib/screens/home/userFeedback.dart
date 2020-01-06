import 'package:flutter/material.dart';

class UserFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tilbakemelding'),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du sende tilbakemeldinger'),
        ))
        );
  }
}