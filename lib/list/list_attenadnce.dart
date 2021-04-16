import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map> details = [
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  },
  {
    "name": "0001 Mr. Prakash Patel",
    "date": "Software Development",
    "in_time": "10:22",
    "out_time": "19:22"
  }
];

Widget attendance(BuildContext context, int index) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
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
                      fontWeight: FontWeight.bold,
                    )),
                margin: EdgeInsets.only( bottom: 10),
              ),
              Text(details[index]['date'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
        ),
        SizedBox(
          width: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/images/in.png",
              width: 20,
              height: 20,
            ),
            SizedBox(
              height: 4,
            ),
            Image.asset(
              "assets/images/out.png",
              width: 20,
              height: 20,
            ),

          ],
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(details[index]['in_time'],
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  )),
              SizedBox(
                height: 10,
              ),
              Text(details[index]['out_time'],
                  style: TextStyle(color: Colors.grey[600], fontSize: 12)),
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
  );
}
