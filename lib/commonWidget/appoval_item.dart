import 'package:flutter/material.dart';
import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Leave/sc_leave.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class ApprovalItem extends StatelessWidget {
  final String title;
  ApprovalItem({this.title});
  @override
  Widget build(BuildContext context) {
   return  Container(
     height: 50,
     width: double.infinity,
     margin: EdgeInsets.only(left: 10, right: 10,top: 10),
     decoration: BoxDecoration(
         color: COLOR.white,
         boxShadow: [
           BoxShadow(
             color: Colors.grey[200],
             blurRadius:1.0, // soften the shadow
            //extend the shadow
             offset: Offset(
               0.0, // Move to right 10  horizontally
               2.0, // Move to bottom 10 Vertically
             ),)
         ],
         borderRadius: BorderRadius.all(
           const Radius.circular(10.0),
         ),
         border: Border.all(width: 1, color: Colors.transparent)),
     child: InkWell(
       child: Align(
         alignment: Alignment.centerLeft,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(
             title,
             style: FONT_CONST.SEMIBOLD_BLACK_13,
           ),
         ),
       ),
       onTap: () {
         Navigator.of(context).push(
             MaterialPageRoute(
                 builder: (BuildContext
                 context) =>
                     LeaveScreen()));
       },
     ),
   );
  }
}

