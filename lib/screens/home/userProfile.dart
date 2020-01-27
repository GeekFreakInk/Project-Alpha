import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.user}) : super(key: key);
  final user;
 
  @override
  _ProfileState createState() => new _ProfileState();  
}



class _ProfileState extends State<Profile>{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService(); // Allow access to signOut() method from auth.dart
  String userEmail;
  String uid;
  bool isAdmin;
  bool result;

  loadAsyncData() async{
    final FirebaseUser user = await auth.currentUser();
    var _userEmail = user.email;
    var _uid = user.uid;
    var _isAdmin = true;
    var _result = true;
    setState(() {
      userEmail = _userEmail;
      uid = _uid;
      isAdmin = _isAdmin;
      result =_result;
    });
  }
  
   @override
    void initState() {
      super.initState();
      loadAsyncData();
    }
 
  @override
  Widget build(BuildContext context) {
    if (result == null){
      //This is what we shpw while we're loading
      return new Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(userEmail),
      ),
      body: ListView(
            children: <Widget>[
              Center(child: Text("Er admin?")),
              Center(child: Text(isAdmin.toString()),),
              Center(child: Text("UID: " + uid)),
              Center(child: RaisedButton(child: Text("Logut"), onPressed: () async {
            await _auth.signOut();
          },),)
            ]
  ));
  }
}   

