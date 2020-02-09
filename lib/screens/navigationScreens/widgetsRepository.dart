
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class Widgets extends StatelessWidget {
  //final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Repository"),
      ),
      body: ListView( 
        children: <Widget>[SizedBox(height: 50, child: Center(child:Text("Small widgets")),),Row(
      children: <Widget>[
        Column(children: <Widget>[
        //https://www.youtube.com/watch?v=7iO2WqaA6oM --> Alert Dialogs 
        RaisedButton(child: Text("Alert box"), onPressed: ()=> Alert(context: context, title: "rflutter_alert", 
        desc: "This is a description",
        buttons: [
          DialogButton(child: Text("subscribe: finnish_profile"), onPressed:() =>  _fcm.subscribeToTopic('finnish_profile')),
          DialogButton(child: Text("unsubscribe: finnish_profile"), onPressed: ()=> _fcm.unsubscribeFromTopic('finnish_profile')),
        ]).show()),
        ],)
      ],
    )]));
  }
}
/* 
  *PUSH NOTIFICATIONS*
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
  } */