
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';

class Courses extends StatefulWidget{

  @override
  _CoursesState createState() => new _CoursesState();
}

class _CoursesState extends State<Courses>{
  
  bool result = false;

  //Location
  PermissionStatus _statusLocation;
  Position _currentPosition;
 

  //Camera
  PermissionStatus _statusCamera;
  PermissionStatus _statusStorage;
  File _image;

  Future getImage(bool isCamera) async{
    File image;
    if(isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }else{
      image = await ImagePicker.pickImage(source: ImageSource.gallery);
    }

    setState((){
      _image = image;
    });
  }
  



  @override
  void initState() {
    super.initState();
    PermissionHandler().checkPermissionStatus(PermissionGroup.locationWhenInUse).then(_updateStatusLocation);
    PermissionHandler().checkPermissionStatus(PermissionGroup.camera).then(_updateStatusCamera);
    PermissionHandler().checkPermissionStatus(PermissionGroup.storage).then(_updateStatusStorage);
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
              //Location permission
              Center(child: SafeArea(child: Text("Location: $_statusLocation"),)),
              SizedBox(height: 25),
              if (_currentPosition != null)
                Center(child:Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),),
                RaisedButton(
                  child: Text("Get location"),
                  onPressed: () {
                    _getCurrentLocation();
                  }),
              SizedBox(height: 5),
              Center(child: RaisedButton(child: Text("Ask permission: Location"), onPressed: _askPermissionLocation,)),
              SizedBox(height: 50),
              //camera permissions
              Center(child: SafeArea(child: Text("Camera: $_statusStorage"),)),
              Center(child: IconButton(icon: Icon(Icons.insert_drive_file),
              onPressed: () {getImage(false);}),), 
              Center(child: RaisedButton(child: Text("Ask permission: Storage"), onPressed: _askPermissionStorage,)),
              SizedBox(height: 5),
              Center(child: SafeArea(child: Text("Camera: $_statusCamera"),)),
              Center(child: IconButton(icon: Icon(Icons.camera_alt),
              onPressed: () {getImage(true);},),),
              Center(child: RaisedButton(child: Text("Ask permission: Camera"), onPressed: _askPermissionCamera,)),
              SizedBox(height: 25),
              _image == null? Container () : Image.file(_image, height: 300.0, width: 300.0,),
            ]
        ));
    }
    //Location Permissions
    void _updateStatusLocation(PermissionStatus status){
        if(status != _statusLocation){
          setState(() {
            _statusLocation = status;
          });
        }
    }
    //This is how you can ask about permission before user utalizes the tools
    void _askPermissionLocation(){
      PermissionHandler().requestPermissions([PermissionGroup.locationWhenInUse]).then(_onStatusRequestedLocation);
    }
    
    void _askPermissionCamera(){
      PermissionHandler().requestPermissions([PermissionGroup.camera]).then(_onStatusRequestedCamera);
    }

    void _askPermissionStorage(){
      PermissionHandler().requestPermissions([PermissionGroup.storage]).then(_onStatusRequestedStorage);
    }

    void _onStatusRequestedLocation(Map<PermissionGroup, PermissionStatus> statuses){
      final status = statuses[PermissionGroup.locationWhenInUse];
      if(status != PermissionStatus.granted){
        PermissionHandler().openAppSettings();
      }else{
        _updateStatusLocation(status);
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

  //Camera permissions

   void _updateStatusCamera(PermissionStatus status){
        if(status != _statusCamera){
          setState(() {
            _statusCamera = status;
          });
        }
    }

    void _updateStatusStorage(PermissionStatus status){
      if(status != _statusStorage){
          setState(() {
            _statusStorage = status;
          });
        }
    }

    void _onStatusRequestedCamera(Map<PermissionGroup, PermissionStatus> statuses){
      final status = statuses[PermissionGroup.camera];
      if(status != PermissionStatus.granted){
        PermissionHandler().openAppSettings();
      }else{
        _updateStatusCamera(status);
      }
      
    }

    void _onStatusRequestedStorage(Map<PermissionGroup, PermissionStatus> statuses){
      final status = statuses[PermissionGroup.storage];
      if(status != PermissionStatus.granted){
        PermissionHandler().openAppSettings();
      }else{
        _updateStatusStorage(status);
      }
      
    }
    
}