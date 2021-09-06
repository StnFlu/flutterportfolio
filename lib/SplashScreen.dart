import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterportfolio/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  void initState()
  {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }
  route(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SnowRyde()),
    );
  }
  void restartTimer() {
    startTime().cancel();
    startTime();
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/logo.png"),
              height: 40,
              width:  40,
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              "Daniel Monk",
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black54
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 180.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }


}
