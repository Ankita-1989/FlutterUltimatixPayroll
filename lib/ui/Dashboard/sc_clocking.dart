import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

import '../../utils/COLOR.dart';

class ClockingScreen extends StatefulWidget {
  @override
  _ClockingScreenState createState() => _ClockingScreenState();
}

class _ClockingScreenState extends State<ClockingScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 15, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //change here don't //worked
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      "Clocking",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                    new Spacer(),

                    Icon(
                      Icons.refresh,
                      color: COLOR.white,
                    )
                  ],
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: double.infinity,
                    child: Card(
                      color: COLOR.white,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 2, top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //change here don't //worked
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.date_range),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: Text(
                                      "Wednesday, March 11, 2020",
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: COLOR.BLACK, fontSize: 12),
                                    ),
                                  ),
                                ),
                                Icon(Icons.alarm),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "04:59 pm",
                                      style: TextStyle(
                                          color: COLOR.BLACK, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 15, right: 15, bottom: 10),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 46,
                                        margin: EdgeInsets.only(right: 6),
                                        decoration: BoxDecoration(
                                          color: COLOR.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            color: COLOR.BORDER,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: OutlineButton(
                                            child: new Text(
                                              "Clocking",
                                              style: TextStyle(
                                                  color: COLOR.BLACK,
                                                  fontSize: 12),
                                            ),
                                            onPressed: null,
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0))))),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 46,
                                        margin: EdgeInsets.only(right: 6),
                                        decoration: BoxDecoration(
                                          color: COLOR.SELECTED_COLOR,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            width: 1.5,
                                          ),
                                        ),
                                        child: OutlineButton(
                                            child: new Text(
                                              "Clock out",
                                              style: TextStyle(
                                                  color: COLOR.white,
                                                  fontSize: 12),
                                            ),
                                            onPressed: null,
                                            shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        30.0))))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: COLOR.white),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://googleflutter.com/sample_image.jpg'),
                            fit: BoxFit.fill),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                child: Card(
                  color: COLOR.white,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 10, top: 10, bottom: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 16,
                          ),
                          Flexible(
                            child: Text(
                              'Kataria Arcade Makarba, Ahmedabad, Gujarat- 380008, India',
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12,
                                color: COLOR.BLACK,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Container(
                width: double.infinity,
                child: Card(
                  color: COLOR.white,
                  margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Row(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Last Clocking",
                                style: FONT_CONST.SEMIBOLD_BLACK_14,
                              ),
                            ),
                            Spacer(),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )),
                          ],
                        ),
                      ),
                      Divider(
                        color: COLOR.textcolor,
                      ),
                      Container(
                        width: double.infinity,
                        height: 30,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.date_range,
                              size: 16,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 2),
                                child: Text(
                                  "Wednesday, March 11, 2020",
                                  style: TextStyle(
                                      color: COLOR.BLACK, fontSize: 12),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.alarm,
                              size: 16,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "04:59 pm",
                                  style: TextStyle(
                                      color: COLOR.BLACK, fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10),
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 10),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 16,
                              ),
                              Flexible(
                                child: Text(
                                  'Kataria Arcade Makarba, Ahmedabad, Gujarat- 380008, India',
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: COLOR.BLACK,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }
}
