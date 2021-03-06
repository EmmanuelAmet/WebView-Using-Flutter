import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import './MyWebView.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webview Widget',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF02BB9F),
        primaryColorDark: const Color(0xFF167F57),
        accentColor: const Color(0xFF02BB9F),
      ),
      home: MyHomePage(title: 'Webview Widget'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title,style: TextStyle(color:Colors.white),),

        ),
        body: ProgressHUD(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl:"https://www.google.com",
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: pageFinishedLoading,
                ),
              ],
            ),
          ),
          inAsyncCall: _isLoading,
          opacity: 0.0,
        ));
  }
  void pageFinishedLoading(String url) {
    setState(() {
      _isLoading = false;
    });
  }
}
