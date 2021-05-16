
import 'package:flutter/material.dart';

class Condition extends StatefulWidget {
  final String text;
  final Color checkedColor;
  final Color uncheckedColor;
  final bool checked;
  final Widget customText;

  Condition(this.text, this.checkedColor, this.uncheckedColor, this.customText,
      this.checked);

  @override
  _ConditionState createState() => _ConditionState(
      text: text,
      checkedColor: checkedColor,
      uncheckedColor: uncheckedColor,
      customText: customText,
      isChecked: checked);
}

class _ConditionState extends State<Condition> {
  bool isChecked;
  final String text;
  final Color checkedColor;
  final Color uncheckedColor;
  final Widget customText;

  _ConditionState(
      {this.text,
        this.checkedColor,
        this.uncheckedColor,
        this.customText,
        this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          child: MaterialButton(
            color: (isChecked) ? checkedColor : uncheckedColor,
            elevation: 0,
            onPressed: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: const Text(''),
            shape:
            BeveledRectangleBorder(side: const BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(1)),
          ),
        ),
        const SizedBox(width: 25),
        Flexible(
          child: (customText == null)
              ? Text(
            '$text',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )
              : customText,
        )
      ],
    );
  }
}