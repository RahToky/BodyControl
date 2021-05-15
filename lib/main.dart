import 'package:body_control/pages/authorisation/authorisation.dart';
import 'package:body_control/pages/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingPages.ROUTE_NAME: (context) => OnBoardingPages(),
        AuthorisationPage.ROUTE_NAME: (context) => AuthorisationPage()
      },
      home: SplashScreen(
        seconds: 1,
        navigateAfterSeconds: OnBoardingPages(),
        title: Text(
          'Welcome In SplashScreen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        image: Image.asset('logos/app_logo.png'),
        backgroundColor: Colors.blue,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
      ),
    );
  }
}