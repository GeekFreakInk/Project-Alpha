import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/services/auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';

class Profile extends StatefulWidget {
  Profile({Key key, this.user}) : super(key: key);
  final user;
 
  @override
  _ProfileState createState() => new _ProfileState();  
}



class _ProfileState extends State<Profile>{
  PermissionStatus _status;
  Position _currentPosition;
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
      PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse).then(_updateStatus);
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
              Center(child: SafeArea(child: Text("$_status"),)),
              SizedBox(height: 60),
              Center(child: RaisedButton(child: Text("Ask permission"), onPressed: _askPermission,)),
              SizedBox(height: 60),
              if (_currentPosition != null)
                Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
                FlatButton(
                  child: Text("Get location"),
                  onPressed: () {
                    _getCurrentLocation();
                  }),
              Center(child: RaisedButton(child: Text("Logut"), onPressed: () async {
            await _auth.signOut();
          },),)
            ]
        ));
    }

    void _updateStatus(PermissionStatus status){
        if(status != _status){
          setState(() {
            _status = status;
          });
        }
    }

    void _askPermission(){
      PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse]).then(_onStatusRequested);
    }

    void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses){
      final status = statuses[PermissionGroup.locationWhenInUse];
      if(status != PermissionStatus.granted){
        PermissionHandler().openAppSettings();
      }else{
        _updateStatus(status);
      }
      
    }

    void _getCurrentLocation(){
      final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

      geolocator
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
      .then((Position position){
        setState(() {
          _currentPosition = position;
        });
      }).catchError((e){
        print(e);
      });
    }  
}   

