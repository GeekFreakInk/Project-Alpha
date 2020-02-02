import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Courses extends StatefulWidget{

  @override
  _CoursesState createState() => new _CoursesState();
}

class _CoursesState extends State<Courses>{
  PermissionStatus _status;
  Position _currentPosition;
  String userEmail;
  String uid;
  bool isAdmin = false;
  bool result = false;


  @override
  void initState() {
    super.initState();
    PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse).then(_updateStatus);
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
    }
    return Scaffold(
      body: ListView(
            children: <Widget>[
              Center(child: SafeArea(child: Text("Location: $_status"),)),
              SizedBox(height: 5),
              Center(child: RaisedButton(child: Text("Ask permission"), onPressed: _askPermission,)),
              SizedBox(height: 5),
              if (_currentPosition != null)
                Center(child:Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),),
                RaisedButton(
                  child: Text("Get location"),
                  onPressed: () {
                    _getCurrentLocation();
                  }), 
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