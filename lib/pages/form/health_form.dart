import 'package:body_control/const/strings.dart';
import 'package:body_control/pages/authorisation/condition.dart';
import 'package:body_control/pages/interface/routable.dart';
import 'package:flutter/material.dart';

import 'field.dart';

class HealthFormPage extends StatelessWidget implements RoutableWidget{

  @override
  String getRouteName() => "/health_form";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top:100),
                child: Text(
                  '${Strings.YOUR_HEALTH}',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  children:[
                    UserTextField('${Strings.YOUR_CURRENT_WEIGHT}',TextInputType.number),
                    UserTextField('${Strings.YOUR_SIZE}',TextInputType.number),
                  ]
                ),
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
