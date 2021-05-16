import 'package:body_control/const/strings.dart';
import 'package:body_control/utils/colorUtil.dart';
import 'package:flutter/material.dart';

class GenderToggle extends StatefulWidget {
  const GenderToggle({Key key}) : super(key: key);

  @override
  _GenderToggleState createState() => _GenderToggleState();
}

class _GenderToggleState extends State<GenderToggle> {
  Color unselectedColor = ColorUtil.fromHex("#92C5DD");
  List<bool> isSelected = [false, true];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.84,
      decoration: BoxDecoration(
        color: unselectedColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ToggleButtons(
        children: [
          Container(
            width: size.width * 0.42,
            alignment: Alignment.center,
            child: Text(
              '${Strings.MAN}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: size.width * 0.42,
            alignment: Alignment.center,
            child: Text(
              '${Strings.WOMAN}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        renderBorder: false,
        isSelected: isSelected,
        borderRadius: BorderRadius.circular(10),
        selectedColor: Colors.black54,
        fillColor: Colors.white,
        color: Colors.white,
      ),
    );
  }
}