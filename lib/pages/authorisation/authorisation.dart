import 'package:body_control/const/strings.dart';
import 'package:body_control/utils/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthorisationPage extends StatelessWidget {

  static const ROUTE_NAME = 'authorisation';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        // color: ColorUtil.fromHex('#59A6CC'),
        padding: EdgeInsets.only(top:110),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/onboarding1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(Strings.AUTH_AND_CONFIDENT,style: TextStyle(color: Colors.white, fontSize: 34,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
