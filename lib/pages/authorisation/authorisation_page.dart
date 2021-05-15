import 'package:body_control/const/strings.dart';
import 'package:body_control/interface/routable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'condition.dart';

class AuthorisationPage extends StatelessWidget implements RoutableWidget {

  @override
  String getRouteName() => "/authorisation";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bgColor = Theme.of(context).primaryColor;
    final buttonColor = Theme.of(context).accentColor;

    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              /** TITLE **/
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(top: size.width * 0.3),
                  width: double.infinity,
                  child: const Text(
                    '${Strings.AUTH_AND_CONFIDENT}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),

              /** CONTENT **/
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    children: [
                      Condition('${Strings.AUTH_CLAUSE_1}', buttonColor,
                          bgColor, null, false),
                      const SizedBox(height: 40),
                      Condition('${Strings.AUTH_CLAUSE_2}', buttonColor,
                          bgColor, null, false),
                      const SizedBox(height: 40),
                      Condition('${Strings.AUTH_CLAUSE_2}', buttonColor,
                          bgColor, _buildCustomCondition(), true),
                    ],
                  ),
                ),
              ),

              /** BOTTOM BUTTONS **/
              Expanded(
                flex: 3,
                child: Container(
                  width: size.width * 0.85,
                  child: Column(
                    children: [
                      MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        color: buttonColor,
                        elevation: 0,
                        child: Text(
                          '${Strings.ACCEPT}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        shape: BeveledRectangleBorder(
                          side: BorderSide(color: buttonColor),
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(height: 10),
                      MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        child: const Text(
                          '${Strings.CONTINUE_ANONYMOUSLY}',
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        shape:const BeveledRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

Widget _buildCustomCondition() {
  return RichText(
      text: TextSpan(children: [
        const TextSpan(text: 'J\'accepte vos '),
    TextSpan(
      text: '${Strings.TERMS_OF_SERVICE}',
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launch(
              "https://marvelapp.com/prototype/5aj6hjj/screen/65343020/handoff");
        },
    ),
        const TextSpan(text: ' et votre'),
    TextSpan(
      text: '${Strings.PRIVACY_POLICY}',
      style: const TextStyle(
        decoration: TextDecoration.underline,
      ),
      recognizer: TapGestureRecognizer()
        ..onTap = () {
          launch(
              "https://marvelapp.com/prototype/5aj6hjj/screen/65343020/handoff");
        },
    ),
  ]));
}

