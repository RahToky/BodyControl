import 'dart:ui';

import 'package:body_control/pages/home/home_page.dart';
import 'package:body_control/utils/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

import 'pages/intro/form/about_form_page.dart';
import 'pages/intro/form/health_form_page.dart';
import 'pages/intro/onboarding/onboarding_page.dart';
import 'pages/intro/authorisation/authorisation_page.dart';
import 'pages/intro/form/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorUtil.fromHex("#40A7D5"),
        accentColor: ColorUtil.fromHex("#112948"),
        backgroundColor: ColorUtil.fromHex("#40A7D5"),
        hintColor: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        OnBoardingPages().getRouteName(): (context) => OnBoardingPages(),
        AuthorisationPage().getRouteName(): (context) => AuthorisationPage(),
        AboutUserFormPage().getRouteName(): (context) => AboutUserFormPage(),
        HealthFormPage().getRouteName(): (context) => HealthFormPage(),
        LoginPage().getRouteName(): (context) => LoginPage(),
        HomePage().getRouteName(): (context) => HomePage(),
      },
      home: SplashScreen(
              seconds: 3,
              navigateAfterSeconds: OnBoardingPages(),
              backgroundColor: Colors.blue,
              useLoader: false,
              imageBackground: AssetImage('assets/logos/splash.png'),
            ),
    );
  }
}

class MySplashScreen extends SplashScreen {}
