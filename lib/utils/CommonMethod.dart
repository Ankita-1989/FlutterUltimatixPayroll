import 'package:flutter/cupertino.dart';

import 'COLOR.dart';

class CommonMethod {
  static final BoxDecoration baseBackgroundDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [COLOR.SELECTED_COLOR, COLOR.MAIN_COLOR, COLOR.white]));
}
