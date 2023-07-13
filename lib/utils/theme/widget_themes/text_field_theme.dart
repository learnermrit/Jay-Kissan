import 'package:flutter/material.dart';
import 'package:jay_kissan/constants/colors.dart';

import '../../../constants/text_strings.dart';

class TTextFormFeildTheme {
  TTextFormFeildTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tSecondaryColor,
    floatingLabelStyle: TextStyle(color: tSecondaryColor),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: tSecondaryColor)),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: tPrimaryColor,
    floatingLabelStyle: TextStyle(color: tPrimaryColor),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: tPrimaryColor)),
  );
}
