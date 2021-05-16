import 'package:body_control/const/strings.dart';
import 'package:body_control/interface/routable.dart';
import 'package:flutter/material.dart';

import 'field.dart';
import 'gender_toggle.dart';
import 'health_form_page.dart';

class AboutUserFormPage extends StatelessWidget implements RoutableWidget {
  @override
  String getRouteName() => "/about_form";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
          child: Column(
            children: [
              Text(
                '${Strings.TELL_US_ABOUT_YOU}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: size.width * 0.84,
                child: Column(
                  children: [
                    GenderToggle(),
                    SizedBox(height: 10),
                    UserTextField(Strings.FIRSTNAME, TextInputType.name),
                    SizedBox(height: 10),
                    UserTextField(Strings.LASTNAME, TextInputType.name),
                    SizedBox(height: 10),
                    UserTextField(Strings.TOWN, TextInputType.text),
                    SizedBox(height: 10),
                    UserTextField(Strings.EMAIL, TextInputType.emailAddress),
                    SizedBox(height: 10),
                    UserTextField(
                        Strings.PASSWORD, TextInputType.visiblePassword),
                    SizedBox(height: 10),
                    UserTextField(Strings.PASSWORD_CONFIRM,
                        TextInputType.visiblePassword),
                    SizedBox(height: 10),
                    UserTextField(
                        Strings.DATE_OF_BIRTH, TextInputType.datetime),
                    SizedBox(height: 47),
                    MaterialButton(
                      height: 50,
                      minWidth: double.infinity,
                      color: Theme.of(context).accentColor,
                      elevation: 0,
                      child: Text(
                        '${Strings.CONTINUE}',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      shape: BeveledRectangleBorder(),
                      onPressed: () {
                        Navigator.pushNamed(context, HealthFormPage().getRouteName());},
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Politique de cofidentialité',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
