import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:rflutter_alert/rflutter_alert.dart';

class Home extends StatefulWidget{

  @override
  _HomeState createState() => new _HomeState();

}


class _HomeState extends State<Home>{
  /* PUSH NOTIFICATIONS*/
  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription iosSubscription;
  @override
  void initState(){
    super.initState();
    if(Platform.isIOS){{
      iosSubscription = _fcm.onIosSettingsRegistered.listen((data){
        //Save the token OR subscribe to a topic here
      });
      _fcm.requestNotificationPermissions(IosNotificationSettings());
      
    }
    _fcm.configure(
      onMessage: (Map<String, dynamic> message)async{
        print("onMessage: $message");
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(child: Text("Ok"), onPressed: ()=> Navigator.of(context).pop(),),
            ],
          ), 
        );
      },
      onLaunch: (Map<String, dynamic> message) async{
        print("onLaunch:  $message");
        //TODO
      },
      onResume: (Map<String, dynamic> message) async{
        print("onResume: $message");
        //TODO 
      }
      );
    }
  } 
  @override
  Widget build(BuildContext context) {
    return Center(
      //https://www.youtube.com/watch?v=7iO2WqaA6oM --> Alert Dialogs
      child: RaisedButton(child: Text("Alert box"), onPressed: ()=> Alert(context: context, title: "rflutter_alert", 
      desc: "This is a description",
      buttons: [
        DialogButton(child: Text("subscribe: finnish_profile"), onPressed:() =>  _fcm.subscribeToTopic('finnish_profile')),
        DialogButton(child: Text("unsubscribe: finnish_profile"), onPressed: ()=> _fcm.unsubscribeFromTopic('finnish_profile')),
      ]).show()),
    );
  }
}