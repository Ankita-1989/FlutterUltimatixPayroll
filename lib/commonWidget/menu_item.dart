import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class MenuItem extends StatelessWidget {
  final String title,title1;
  MenuItem({this.title, this.title1});
  @override
  Widget build(BuildContext context) {
   return  Container(
     margin: EdgeInsets.only(top: 10, left: 10,bottom: 10,right: 10),
     child: Row(
       children: <Widget>[
         Align(
           alignment: Alignment.topLeft,
           child: Text(
             title,
             style: FONT_CONST.SEMIBOLD_BLACK_12,
           ),
         ),
         Spacer(),
         Align(
           alignment: Alignment.topRight,
           child: Text(
            title1,
             style: FONT_CONST.REGULAR_BLACK1_12,
           ),
         ),
       ],
     ),
   );
  }
}

