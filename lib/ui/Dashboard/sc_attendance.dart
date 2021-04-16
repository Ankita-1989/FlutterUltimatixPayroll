import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/list/list_attenadnce.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';

import '../../utils/COLOR.dart';

class Attendance extends StatefulWidget {
  @override
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  var date;
  String formattedDate;

  @override
  Widget build(BuildContext context) {
    var itemCount = 8;
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //change here don't //worked
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "My Attendance",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Card(
                margin: EdgeInsets.only(left: 5, right: 5, top: 39),
                color: COLOR.white,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10, left: 5),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: COLOR.DARK_GREY),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                      child: Column(
                        children: <Widget>[
                          Container(
                              margin:
                                  EdgeInsets.only(left: 3, top: 5, bottom: 5),
                              child: Text(
                                "0001 Mr. Prakash Patel",
                                style: TextStyle(
                                    color: COLOR.BLACK,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )),
                          Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text("Software Development",
                                  style: TextStyle(
                                      color: COLOR.PrimaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold))),
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            width: 150,
                            child: Stack(children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 1),
                                child: Icon(
                                  Icons.date_range,
                                  size: 16,
                                  color: COLOR.SELECTED_COLOR,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 22),
                                child: Text(
                                  "This Month",
                                  style: TextStyle(
                                      color: COLOR.SELECTED_COLOR,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Card(
                color: COLOR.white,
                child: itemCount > 0
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return attendance(context, index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      )
                    : Center(child: const Text('No items')),
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }
}
