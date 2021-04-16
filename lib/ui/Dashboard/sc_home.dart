import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/Constant/Constant.dart';
import 'package:flutter_payrollapp/Constant/PreferenceUtils.dart';
import 'package:flutter_payrollapp/api_repository/api.dart';
import 'package:flutter_payrollapp/response_model/clockinout.dart';
import 'package:flutter_payrollapp/ui/Leave/sc_leaveapproval.dart';
import 'package:flutter_payrollapp/ui/sc_myattendance.dart';
import 'package:flutter_payrollapp/ui/sc_newsfeed.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:intl/intl.dart';

import '../../utils/COLOR.dart';
import '../sc_profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isProgress = false;
  Data streams;
  var  date='',time='', add_line='';
  String formattedTime, current_date;

  void _clockinoutApi() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() {
        FocusScope.of(context).requestFocus(FocusNode());
        _isProgress = true;
      });

      /*----------API url----------------*/
      var customBody = Constant.CLOCKINOUTSTATUS +
          "EmpID=" +
          PreferenceUtils.getString("EmpId") +
          "&CmpID=" +
          PreferenceUtils.getString("CmpId");

      print(customBody);

      /*----------API Body----------------*/

      String response = await callGetMethod(context, customBody);
      /*----------API Response----------------*/
      ClockInOutModel streams = ClockInOutModel.fromJson(json.decode(response));
      if (streams.status == true) {
        // var date_time=streams.data.iODatetime.split("T");
        // date1=DateTime.parse(date_time[0].trim());
        var date2 = DateTime.parse(streams.data.iODatetime);
        var add = streams.data.location.split(':');
        add_line = add[1];
        if (add[0] == "In   ") {
          add_line = "Clock-In $add_line";
        } else {
          add_line = "Clock-Out $add_line";
        }
        date=DateFormat.yMMMMEEEEd().format(date2);
        time=DateFormat.jm().format(date2);
        print(DateFormat.yMMMMEEEEd().format(date2));
        print(DateFormat.jm().format(date2));
        PreferenceUtils.setString("ClockInOutStatusData", json.encode(streams.data));
        setState(() {
          _isProgress = false;
        });
      } else {
        setState(() {
          _isProgress = false;
        });
        // if (streams != null && streams.msg.isNotEmpty) {
        // }
      }
    } else {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PreferenceUtils.init();
    var now = new DateTime.now();
    current_date = DateFormat.yMMMEd().format(now);
    formattedTime = DateFormat('KK:mm:a').format(now);
    _clockinoutApi();
    // streams = Data.fromJson(
    //     json.decode(PreferenceUtils.getString("ClockInOutStatus")));
    // date2 = DateTime.parse(streams.iODatetime);
    // var add = streams.location.split(':');
    // add_line = add[1];
    // if (add[0] == "In   ") {
    //   add_line = "Clock-In $add_line";
    // } else {
    //   add_line = "Clock-Out $add_line";
    // }
  }

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Home",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                    new Spacer(),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("assets/images/news.png"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => NewsFeed()));
                      },
                    ),
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
                                      current_date,
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
                                      formattedTime,
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
                                              "My Profile",
                                              style: TextStyle(
                                                  color: COLOR.BLACK,
                                                  fontSize: 13),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ProfileScreen()));
                                            },
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
                                              "My Attendance",
                                              style: TextStyle(
                                                  color: COLOR.white,
                                                  fontSize: 13),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          MyAttendance()));
                                            },
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Self Discipline Indicator (For own Reference only)",
                            style: FONT_CONST.SEMIBOLD_BLACK_13,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 10),
                        color: COLOR.textcolor,
                      ),
                      Container(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    '05:35',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: COLOR.textcolor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    '02:24',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: COLOR.textcolor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    '00:00',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              // VerticalDivider(
                              //   color: COLOR.white,
                              // ),
                            ],
                          )),
                      Container(
                        height: 1,
                        color: COLOR.textcolor,
                      ),
                      Container(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    'Worktime',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: COLOR.textcolor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    'Remaining',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                color: COLOR.textcolor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    'Overtime',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                ),
                              ),
                              // VerticalDivider(
                              //   color: COLOR.white,
                              // ),
                            ],
                          ))
                    ],
                  ),
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
                                style: FONT_CONST.SEMIBOLD_BLACK_13,
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
                                  date,
                                  style: TextStyle(
                                      color: COLOR.BLACK, fontSize: 13),
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
                                time,
                                  style: TextStyle(
                                      color: COLOR.BLACK, fontSize: 13),
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
                                  add_line,
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: COLOR.SELECTED_COLOR,
                                  ),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                margin:
                    EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: COLOR.SELECTED_COLOR,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: InkWell(
                          child: Text(
                            "Leave Approval",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: COLOR.white, fontSize: 13),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    LeaveApprovalScreen()));
                          },
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: COLOR.white,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "Regularization Approval",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: COLOR.white, fontSize: 13),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      color: COLOR.white,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "Cancellation Approval",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: COLOR.white, fontSize: 13),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    return Scaffold(body: _myWidget);
  }


}
