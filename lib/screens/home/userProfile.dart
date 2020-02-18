import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/profilePictureStandard.dart';
import 'package:studybuddy_mobile/services/auth.dart';
import 'package:studybuddy_mobile/services/usersAPI.dart';
import 'package:studybuddy_mobile/shared/constants.dart';



class Profile extends StatefulWidget {
 
  @override
  _ProfileState createState() => new _ProfileState();  
}



class _ProfileState extends State<Profile>{
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AuthService _auth = AuthService(); // Allow access to signOut() method from auth.dart
  String userEmail = "";
  String uid = "";
  bool isAdmin = false;
  bool result;

  loadAsyncData() async {
    final FirebaseUser user = await auth.currentUser();
    var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
    await connection.open();
    dynamic result = await connection.query("SELECT * FROM users WHERE id = '${user.uid}'");
    bool _isAdmin;
   
    try{
      if(result[0][3] == true){
      _isAdmin = true;
      }
    }catch(e){
      registerUser(user);
    }
    
    setState(() {
        userEmail = user.email;
        uid = user.uid;
        isAdmin = _isAdmin;
    });
    connection.close();
  }

  @override
  void initState() {
    super.initState();
    loadAsyncData().then(_update);
  }
  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (result == null){
      return new Container(
        child: CircularProgressIndicator(backgroundColor: Colors.white,),
      );
    }else{
      return Scaffold(
      appBar: AppBar(
        title: Text(userEmail ?? "loading"),
      ),
      body: ListView(
            children: <Widget>[
              Center(child: Text(userEmail, style: TextStyle(fontSize: 30),),),
              Divider(indent: 50, endIndent: 50, color: Colors.grey, thickness: 1.5,),
              ProfilePictureStandard(),
              SizedBox(height: 50,),
              Center(child: Text("Er admin?")),
              Center(child: Text(isAdmin.toString() ?? "loading", style: TextStyle(fontWeight: FontWeight.bold),),),
              Center(child: Text("UID: " + uid ?? "loading")),
              SizedBox(height: 100),
              Center(child: RaisedButton(child: Text("register bruker"), onPressed: () {Navigator.pushNamed(context, registerUserRoute);}),),
              Center(child: RaisedButton(child: Text("Logut"), onPressed: () async {
            await _auth.signOut();
            Navigator.popAndPushNamed(context, homeRoute);
          },),)
            ]
        ));
    }
  }
  void _update(dynamic status){
    setState(() {
      result = true;
    });
  }
}   

