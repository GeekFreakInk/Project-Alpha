import 'dart:convert';
import 'dart:io';

import 'package:postgres/postgres.dart';

Future registerUser(user) async{
    var url = "http://10.0.2.2:5000/api/register";
    Map body = {
      "id": user.uid, 
      "userName": user.email,
      "isTeacher": false,
      "isAdmin" : false
    };
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(body)));
    HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
}

//Update User



//Delete User


//Read User
fetchUsers() async{
  var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
  await connection.open();
  dynamic result = await connection.query("SELECT * FROM users");
  connection.close();
  return result;
}

fetchUser(user) async{
  var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
  await connection.open();
  dynamic result = await connection.query("SELECT * FROM users WHERE id = '${user.uid}'");
  connection.close();
  return result;
}