import 'package:flutter/material.dart';

class _AcademicLevelState extends State<AcademicLevel>{
  Item selectedLevel;
  List<Item> levels = <Item>[
    const Item('Ungdomsskole',Icon(Icons.school, color:  const Color(0xFF167F67),)),
    const Item('Videregående',Icon(Icons.school, color:  const Color(0xFF167F67),)),
    const Item('Universitetet',Icon(Icons.school,color:  const Color(0xFF167F67),)),
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Item>(
      hint: Text("Velg nivå"),
      value: selectedLevel,
      onChanged: (Item value){
        setState(() {
          selectedLevel = value;
        });
      },
      items: levels.map((Item level){
        return DropdownMenuItem<Item>(
          value: level,
          child: Row(
            children: <Widget>[
              level.icon,
              SizedBox(width: 10,),
              Text(level.level, style: TextStyle(color: Colors.black),),
            ],
          ),
        );
      }
    ).toList());
  }
}

class AcademicLevel extends StatefulWidget{
  @override
  _AcademicLevelState createState() => new _AcademicLevelState();
}

class Item{
  const Item(this.level, this.icon);
  final String level;
  final Icon icon;
}