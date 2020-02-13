import 'package:flutter/material.dart';

class ProfilePictureStandard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: <Widget>[
      Align(alignment: Alignment.center,
       child: ClipRRect(
         borderRadius: BorderRadius.circular(8.0),
         child: Image(image: NetworkImage("https://api.adorable.io/avatars/250/abott@adorable.png"),
          width: 250,
          height: 250,)),),
      SizedBox(height: 15,),
      Align(alignment: Alignment.centerLeft, child: Container(margin: EdgeInsets.only(left: 65), child: Row(children: <Widget>[
        Icon(Icons.info), 
        SizedBox(width: 15),
        Text("Vis karakterer"),
      ],))),
      SizedBox(height: 15,),
      Align(alignment: Alignment.center, child: 
      Container(margin: EdgeInsets.fromLTRB(20,0,20,0), child:RichText(text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: "Velkommen til min profil! Den har ikke så veldig mye styling, men det kan hende det kommer i fremtiden"),
          ]
        ),),))
        
            
    ],);
  }
}