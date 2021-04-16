import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';

import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Leave/sc_leaveapproval.dart';

final List<Map> details = [
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 to 10/04/2020",
    "leave_type": "Casual Leave",
    "day": "0.5 days"
  }
];

Widget leaveappapproval(BuildContext context, int index) {
  return InkWell(
    child: Container(
      width: double.infinity,
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
      margin: EdgeInsets.only(left: 2, right: 2, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "assets/images/emp.png",
            width: 70,
            height: 70,
            alignment: Alignment.bottomLeft,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(details[index]['name'],
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Text(details[index]['date'],
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
                Row(
                  children: <Widget>[
                    Text(details[index]['leave_type'],
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(details[index]['day'],
                        style: TextStyle(
                          color: Colors.orange[600],
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        )),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ],
      ),
    ),
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => LeaveApprovalScreen()));
    },
  );
}
