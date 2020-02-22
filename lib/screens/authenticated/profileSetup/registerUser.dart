import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'step1.dart';
import 'step2.dart';
import 'step3.dart';

class _RegisterUserState extends State<RegisterUser>{
  var currentPageValue = 0.0;
  final _controller = PageController(
    initialPage: 0
  );

  int step = 0;
  final List<Widget> widgets = [Step1(), Step2(), Step3()];
  @override
  Widget build(BuildContext context) {
    _controller.addListener((){
      setState(() {
        currentPageValue = _controller.page;
      });
    });
    return Column(
    children: <Widget>[
      SizedBox(height: 705, 
      child:PageView(
          physics: new NeverScrollableScrollPhysics(),
          controller: _controller,
          children: <Widget>[
            Step1(),
            Step2(),
            Step3()
          ],
        ),
    ),
    Row(
      children: <Widget>[
      RaisedButton(child: Text("Gå til forrige side"),
      onPressed:(){
        if(currentPageValue != 0.0){
           _controller.previousPage(curve: Curves.easeInOut, duration: const Duration(milliseconds: 200));
        }
      }),
      RaisedButton(child: Text("Gå til neste side"),
      onPressed: (){
        if(currentPageValue != 2.0){
         _controller.nextPage(curve: Curves.easeInOut, duration: const Duration(milliseconds: 200));
        }       
      },)],
    )]);
  }
}


class UserType extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.white,
    child:GridView.count(
      primary: false,
      padding: const EdgeInsets.only(top: 200),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
         GestureDetector(
          onTap: ()=> {},
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Align( alignment: Alignment.center, child: const Text("Lærere"),),
            color: Colors.black,
          )
        ),
        GestureDetector(
          onTap: ()=> {},
          child:  Container(
          padding: const EdgeInsets.all(8),
          child: Align( alignment: Alignment.center, child: const Text("Elev")),
          color: Colors.black,
          )
        ),
      ]
    ));
  }
}

class RegisterUser extends StatefulWidget{
  @override
  _RegisterUserState createState() => new _RegisterUserState();
}