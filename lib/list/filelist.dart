import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';

final List<Map> details = [
  {"title": "Education Certificate", "name": "Education certificate.pdf"},
  {
    "title": "Education Certificate",
    "name": "Education certificate.pdf",
  },
  {"title": "Education Certificate", "name": "Education certificate.pdf"},
  {"title": "Education Certificate", "name": "Education certificate.pdf"},
  {
    "title": "Education Certificate",
    "name": "Education certificate.pdf",
  },
];

Widget filelist(BuildContext context, int index) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
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
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Text(details[index]['title'],
                  style: TextStyle(
                      color: COLOR.BLACK,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: .3)),
              SizedBox(
                height: 6,
              ),
              Text(details[index]['name'],
                  style: TextStyle(
                    color: COLOR.BLACK,
                    fontSize: 12,
                    letterSpacing: .3,
                  )),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              child: Icon(
                Icons.file_download,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
