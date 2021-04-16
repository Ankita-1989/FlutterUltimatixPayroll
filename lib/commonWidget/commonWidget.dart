import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';



// ignore: camel_case_types
class commonWidget extends StatelessWidget  {
  final String title,subtitle;
  final IconData icon;


  /// you can add more fields that meet your needs

   commonWidget({this.title, this.subtitle, this.icon});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon,
                color: COLOR.PrimaryColor, size: 20)),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
              Theme.of(context).textTheme.subtitle1,
            ),

            Text(
              subtitle,
              style: TextStyle(
                  color: COLOR.textcolor,
                  fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }


}