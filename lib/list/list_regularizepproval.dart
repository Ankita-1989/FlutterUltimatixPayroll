import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/sc_regularizeapproval.dart';
import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Leave/sc_leaveapproval.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';

final List<Map> details = [
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "0.5 days"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "10/04/2020 ",
    "in_time":'09:00',
    "out_time":'17:00',
    "day": "full day"
  }
];

Widget regularizeappapproval(BuildContext context, int index) {
  return InkWell(
    child: Container(
      width: double.infinity,
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
      margin: EdgeInsets.only(left: 2, right: 2,top:12),
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
                    style: TextStyle(color: Colors.grey[600], fontSize: 12,fontWeight: FontWeight.w600,)),
                Row(
                  children: <Widget>[
                    Text(details[index]['day'],
                        style: TextStyle(color: Colors.orange[600], fontSize: 12,fontWeight: FontWeight.bold,)),
                  ],
                ),

              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 14,
              ),
              Image.asset(
                "assets/images/in.png",
                width: 20,
                height: 20,
              ),
              SizedBox(
                height: 2,
              ),
              Image.asset(
                "assets/images/out.png",
                width: 20,
                height: 20,
              ),


            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 16,
                ),
                Text(details[index]['in_time'],
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    )),
                SizedBox(
                  height: 8,
                ),
                Text(details[index]['out_time'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),

              ],
            ),
          ),
        ],
      ),
    ),
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              RegularizeApprovalScreen()));
    },
  );
}
