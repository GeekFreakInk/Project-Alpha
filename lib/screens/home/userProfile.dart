import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:studybuddy_mobile/services/auth.dart';



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
    if(result[0][3] == true){
      _isAdmin = true;
    }
    setState(() {
        userEmail = user.email;
        uid = user.uid;
        isAdmin = _isAdmin;
    });
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
      //This is what we shpw while we're loading
      return new Container();
    }else{
      return Scaffold(
      appBar: AppBar(
        title: Text(userEmail ?? "loading"),
      ),
      body: ListView(
            children: <Widget>[
              Center(child: Text("Er admin?")),
              Center(child: Text(isAdmin.toString() ?? "loading"),),
              Center(child: Text("UID: " + uid ?? "loading")),
              SizedBox(height: 50),
              Center(child: RaisedButton(child: Text("Logut"), onPressed: () async {
            await _auth.signOut();
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

