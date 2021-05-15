
import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {

  final TextInputType inputType;
  final String hintText;

  UserTextField(this.hintText, this.inputType);

  @override
  Widget build(BuildContext context) {
    Color hintColor = Theme.of(context).hintColor;
    return
      TextFormField(
        keyboardType: inputType,
        obscureText: inputType==TextInputType.visiblePassword?true:false,
        decoration: InputDecoration(
          hintText: '$hintText',
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(color: hintColor),
          border: InputBorder.none,
        ),
      );
  }
}