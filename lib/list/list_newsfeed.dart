import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<Map> details = [
  {
    "title": "Test",
    "date": "3 days ago",
    "subject": "Description",
    "description":
        "1. Notification in the Mobile app To be added such as Leave Application, Leave Approval as required. 2. post request to be added which will connected to the HR directly with the dynamic name e.g, Helpdesk 3. Upload the document"
  },{
    "title": "Test",
    "date": "3 days ago",
    "subject": "Description",
    "description":
    "1. Notification in the Mobile app To be added such as Leave Application, Leave Approval as required. 2. post request to be added which will connected to the HR directly with the dynamic name e.g, Helpdesk 3. Upload the document"
  },
];

Widget newsfeed(BuildContext context, int index) {
  return Card(
    elevation: 12,
    child: Container(
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(left: 13, right: 13, top: 5, bottom: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 6,
          ),
          Container(
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Text(details[index]['title'],
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                Spacer(),
                Text(details[index]['date'],
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(details[index]['subject'],
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 2,
          ),
          Text(details[index]['description'],
              style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ],
      ),
    ),
  );
}
