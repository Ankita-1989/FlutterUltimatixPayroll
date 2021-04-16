import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class WidgetButton extends StatelessWidget {
  double _height;
  double _width;
  String _text;
  VoidCallback _voidCallback;
  Color color;

  WidgetButton(
      {double height,
      double width = 0,
      String text,
      VoidCallback voidCallback,
      Color color})
      : this._height = height,
        this._width = width,
        this._text = text,
        this.color = color,
        this._voidCallback = voidCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: _width,
        height: _height,
        color: color != null ? color : COLOR.PrimaryColor,
        child: Center(
          child: Text(
            _text,
            style: FONT_CONST.REGULAR_WHITE_15,
          ),
        ),
      ),
      onTap: () {
        _voidCallback();
      },
    );
  }
}
