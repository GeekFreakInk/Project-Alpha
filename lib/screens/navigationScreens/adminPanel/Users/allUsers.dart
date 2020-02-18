import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class _AllUsersState extends State<AllUsers>{
  var users =[];
  bool showPage;

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }
  
  @override
  Widget build(BuildContext context) {
    if(showPage != null){
      return Scaffold(
        appBar: AppBar(
          title: Text("Alle brukere"),
        ),
        body:ListView(
        children: new List.generate(users.length, (index) => new ListTile(
          leading: Icon(Icons.person),
          title: Text(users[index][1]),
          trailing: Icon(Icons.arrow_right),
        ))));
    }else{
      return Container(
        child: CircularProgressIndicator(),
      );
    }
    
  }

  void fetchAllUsers() async{
    var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
    await connection.open();
    dynamic result = await connection.query("SELECT * FROM users");

    setState(() {
      users = result;
      showPage = true;
    });
  }
}


class AllUsers extends StatefulWidget{
  @override
  _AllUsersState createState() => new _AllUsersState();
}