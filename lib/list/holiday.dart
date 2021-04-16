import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';

final List<Map> details = [
  {"name": "Utrayan", "day": "Monday", "date": "13", "month": "Janyuary"},
  {
    "name": "Annual Functional Holiday",
    "day": "Thursday",
    "date": "23",
    "month": "Janyuary"
  },
  {"name": "Gandhi Jayanti", "day": "Friday", "date": "02", "month": "October"},
  {"name": "Dusshera", "day": "Sunday", "date": "25", "month": "October"},
  {
    "name": "Diwali",
    "day": "Sunday-Tuesday",
    "date": "15-17",
    "month": "November"
  },
];

Widget holiday(BuildContext context, int index) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 6, horizontal:6),
    decoration: BoxDecoration(
        color: COLOR.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 1.0, // soften the shadow
            //extend the shadow
            offset: Offset(
              0.0, // Move to right 10  horizontally
              2.0, // Move to bottom 10 Vertically
            ),
          )
        ],
        borderRadius: BorderRadius.all(
          const Radius.circular(10.0),
        ),
        border: Border.all(width: 1, color: Colors.transparent)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/holiday_image_bg.png"),
                    fit: BoxFit.cover),
              ),
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 5),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: Text(
                      details[index]['month'],
                      style: TextStyle(fontSize: 12,
                          color: COLOR.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        details[index]['date'],
                      style: TextStyle(fontSize: 13,
                          color: COLOR.BLACK, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Text(details[index]['name'],
                  style: TextStyle(
                      color: COLOR.BLACK,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .3)),
              SizedBox(
                height: 6,
              ),
              Text(details[index]['day'],
                  style: TextStyle(
                      color: COLOR.BLACK,
                      fontSize: 13,
                      letterSpacing: .3,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    ),
  );
}
