import 'package:body_control/const/strings.dart';
import 'package:body_control/interface/routable.dart';
import 'package:body_control/pages/form/field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget implements RoutableWidget {
  @override
  String getRouteName() => "/login";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Text(
                      '${Strings.TO_LOGIN}',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.08, 60, size.width * 0.08, 0),
                      child: UserTextField(
                          Strings.EMAIL_ADDRESS, TextInputType.name),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                          size.width * 0.08, 10, size.width * 0.08, 0),
                      child: UserTextField(
                          Strings.PASSWORD, TextInputType.visiblePassword),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: size.width*0.08,right: size.width*0.08),
                      child: MaterialButton(
                        height: 50,
                        minWidth: double.infinity,
                        color: Theme.of(context).accentColor,
                        elevation: 0,
                        child: Text(
                          '${Strings.LOGIN}',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        shape: BeveledRectangleBorder(),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('${Strings.FORGOT_YOUR_PASSWORD}',style: TextStyle(color: Colors.white,fontSize: 16),),
                    SizedBox(height: 15),
                    Text('${Strings.REGISTER}',style: TextStyle(color: Colors.white,fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
