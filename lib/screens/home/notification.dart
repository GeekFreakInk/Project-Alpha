import 'package:flutter/material.dart';
import '../../app_localization.dart';

class Notis extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("notifications_")),
        ),
        body: Container(
            child: Center(
          child: Text('Notifikasjon'),
        ))
        );
  }
}
