import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app_localization.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExploreMath extends StatefulWidget{
  @override
  _ExploreMathState createState() => new _ExploreMathState();
  
}

class _ExploreMathState extends State<ExploreMath>{
 Completer<WebViewController> _controller = Completer<WebViewController>(); // --> Bookmark example https://medium.com/flutter/the-power-of-webviews-in-flutter-a56234b57df2
  String resource;
  bool result;
  final _key = UniqueKey();
  int _stackToView = 1;

 @override
 void initState() {
    super.initState();
    updateExplorePath();
  }
  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  void _handleLoad(String value){
    setState((){
      _stackToView = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (result == null){
      //This is what we shpw while we're loading
      return new Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("math_")),
        actions: <Widget>[
          //This drop down menu demonstrates that flutter widgets can be shown over the web view
          //NavigationControls(_controller.future),
          //Menu(_controller.future, () => _favorites),
        ],),
        body: IndexedStack(
        index: _stackToView,
        children: [WebView(
          key: _key,
          initialUrl: resource,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
          onPageFinished: _handleLoad,
        ),
        Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )],
        //floatingActionButton: _bookmarkButton(),
    ));
  }  

  updateExplorePath() async{ 
    String jsonString =
      await rootBundle.loadString('lib/screens/navigationScreens/exploreWidgets/webViews.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    Locale locale = Localizations.localeOf(context);
    
    setState(() {
      resource = jsonMap["Math"][locale.languageCode];
      result = true;
    });
    
  }
}