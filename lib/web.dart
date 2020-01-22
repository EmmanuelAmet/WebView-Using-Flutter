import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './MyWebView.dart';

class UCCWebsite extends StatefulWidget {
  @override
  _UCCWebsiteState createState() => _UCCWebsiteState();
}

class _UCCWebsiteState extends State<UCCWebsite> {
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('UCC Website', style: TextStyle(color:Colors.white),),
        ),
        body: ProgressHUD(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl:"https://ucc.edu.gh",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: pageFinishedLoading,
                ),
              ],
            ),
          ),
          inAsyncCall: _isLoading,
          opacity: 0.0,
        )
    );
  }
  void pageFinishedLoading(String url) {
    setState(() {
      _isLoading = false;
    });
  }
}
