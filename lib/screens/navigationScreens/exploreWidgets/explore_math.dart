import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
        body: WebView(
          initialUrl: resource,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
        //floatingActionButton: _bookmarkButton(),
    );
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