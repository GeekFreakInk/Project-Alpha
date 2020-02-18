import 'dart:convert';
import 'dart:io';

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

Future fetchUsers(user) async{
  //var url = "http://10.0.2.2:5000/api/register";
}