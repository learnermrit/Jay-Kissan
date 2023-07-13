import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); //to avoid creating instance

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style:  ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tDarkColor,
                      side: BorderSide(color: tDarkColor),
                      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
  );

  static final darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style:  ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tDarkColor,
                      backgroundColor: tWhiteColor,
                      side: BorderSide(color: tDarkColor),
                      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                    ),
  );
}
