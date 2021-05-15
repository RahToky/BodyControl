import 'package:body_control/const/strings.dart';
import 'package:body_control/interface/routable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'field.dart';

class HealthFormPage extends StatefulWidget implements RoutableWidget{

  @override
  String getRouteName() => "/health_form";

  @override
  _HealthFormPageState createState() => _HealthFormPageState();
}

class _HealthFormPageState extends State<HealthFormPage> {

  bool status = true;

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
                padding: EdgeInsets.only(top: 100),
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
                padding: EdgeInsets.fromLTRB(
                    size.width * 0.08, 60, size.width * 0.08, 20),
                child: Column(children: [
                  UserTextField(
                      '${Strings.YOUR_CURRENT_WEIGHT}', TextInputType.number),
                  const SizedBox(height: 10),
                  UserTextField('${Strings.YOUR_SIZE}', TextInputType.number),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex:4,
                          child: Text('${Strings.DO_YOU_PRACTICE_SPORT}',
                              style: TextStyle(color: Colors.white,fontSize: 16)),
                        ),
                        Expanded(
                          flex:2,
                          child: FlutterSwitch(
                            width: 75,
                            height: 35,
                            activeText: '  ${Strings.YES}',
                            inactiveText: '${Strings.NO}  ',
                            value: status,
                            padding: 5,
                            activeColor: Colors.transparent,
                            inactiveColor: Colors.transparent,
                            activeToggleColor: Theme.of(context).accentColor,
                            switchBorder: Border.all(
                              color: Colors.white,
                              width: 1.0,
                            ),
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),

              /** BUTTON */
              Container(
                color: Colors.green,
                width: size.width * 0.84,
                margin: const EdgeInsets.only(top: 300),
                child: MaterialButton(
                  height: 50,
                  color: Theme.of(context).accentColor,
                  elevation: 0,
                  child: Text(
                    '${Strings.START}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  shape: const BeveledRectangleBorder(),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
