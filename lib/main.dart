import 'package:body_control/pages/authorisation/authorisation_page.dart';
import 'package:body_control/pages/form/about_form_page.dart';
import 'package:body_control/pages/form/health_form_page.dart';
import 'package:body_control/pages/login/login_page.dart';
import 'package:body_control/pages/onboarding/onboarding_page.dart';
import 'package:body_control/utils/colorUtil.dart';
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
      },
      home: (true)
          ? LoginPage()
          : SplashScreen(
              seconds: 4,
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
