import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/ui/Leave/sc_leaverequest.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:intl/intl.dart';

import '../../utils/COLOR.dart';
import '../../utils/FONT_CONST.dart';
import '../sc_compoff.dart';

enum WidgetMarker { LeaveBalance, LeaveStatus }

class WidgetSwitchDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LeaveScreen(),
      ),
    );
  }
}

class LeaveScreen extends StatefulWidget {
  @override
  _LeaveScreenState createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  String _selectedDate = "";

  Future<void> _selectDate(
      BuildContext context, int first_year, int second_year) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(first_year),
      lastDate: DateTime(second_year),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMd("en_US").format(d);
      });
  }

  WidgetMarker selectedWidgetMarker = WidgetMarker.LeaveBalance;
  String Monthname;
  String year;

  bool isStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    Monthname = DateFormat.MMMM().format(now);
    year = DateFormat.y().format(now);
    print(year);
    _selectedDate = DateFormat.yMMMd("en_US").format(now);
  }

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
                margin: EdgeInsets.only(left: 15, right: 15, top:50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DashboardScreen()));
                      },
                    ),
                    SizedBox(width: 3,),
                    Text(
                      "Leave",
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
                          image: AssetImage("assets/images/compoff.png"),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CompoffScreen()));
                      },
                    ),
                   InkWell(
                     onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                           builder: (BuildContext context) =>
                               LeaveRequestScreen()));
                     },
                       child:Icon(
                     Icons.add,
                     color: COLOR.white,
                   )),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 46,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.PrimaryColor,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.PrimaryColor,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                                child: new Text(
                                  "Balance",
                                  style: TextStyle(
                                      color: COLOR.white, fontSize: 12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedWidgetMarker =
                                        WidgetMarker.LeaveBalance;
                                  });
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: 46,
                            margin: EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              color: COLOR.Status,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: COLOR.Status,
                                width: 1.5,
                              ),
                            ),
                            child: OutlineButton(
                                child: new Text(
                                  "Status",
                                  style: TextStyle(
                                      color: COLOR.white, fontSize: 12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedWidgetMarker =
                                        WidgetMarker.LeaveStatus;
                                  });
                                },
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0))))),
                  ],
                ),
              ),
              Container(
                child: getChildContainer(),
              )
            ],
          ),
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }

  Widget getChildContainer() {
    switch (selectedWidgetMarker) {
      case WidgetMarker.LeaveBalance:
        return getLeavebalance();
      case WidgetMarker.LeaveStatus:
        return getLeaveStatus();
    }
    return getLeavebalance();
  }

  Widget getLeavebalance() {
    return Column(
      children: <Widget>[
        Container(
          child: Card(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            color: COLOR.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Month",
                              style: FONT_CONST.BOLD_BLACK_12,
                            ),
                            margin: EdgeInsets.only(
                              left: 2,
                              top: 10,
                            ),
                          ),
                          Container(
                              width: 130,
                              child: DropdownButton<String>(
                                  isExpanded: true,
                                  underline: Container(
                                    color: COLOR.BLACK,
                                    height: 1,
                                  ),
                                  iconSize: 35,
                                  style: FONT_CONST.REGULAR_BLACK1_12,
                                  iconEnabledColor: COLOR.BLACK,
                                  items: <String>[
                                    'January',
                                    'February',
                                    'March',
                                    'April',
                                    'May',
                                    'June',
                                    'July',
                                    'August',
                                    'September',
                                    'October',
                                    'November',
                                    'December'
                                  ].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String newKey) {
                                    setState(() {
                                      this.Monthname = newKey;
                                    });
                                  },
                                value: Monthname,)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "Year",
                              style: FONT_CONST.BOLD_BLACK_12,
                            ),
                            margin: EdgeInsets.only(
                              left: 2,
                              top: 10,
                            ),
                          ),
                          Container(
                              width: 130,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: Container(
                                  color: COLOR.BLACK,
                                  height: 1,
                                ),
                                iconSize: 35,
                                iconEnabledColor: COLOR.BLACK,
                                style: FONT_CONST.REGULAR_BLACK1_12,
                                items: <String>[
                                  '2021',
                                  '2022',
                                  '2023',
                                  '2024',
                                  '2025',
                                  '2026',
                                  '2027',
                                  '2028',
                                  '2029',
                                  '2030',
                                ].map((String value1) {
                                  return new DropdownMenuItem<String>(
                                    value: value1,
                                    child: new Text(value1),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    this.year = value;
                                  }
                                  );
                                },
                                value: year,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    width: double.infinity,
                    height: 43,
                    margin: EdgeInsets.only(
                        right: 30, top: 20, left: 30, bottom: 10),
                    decoration: BoxDecoration(
                      color: COLOR.SELECTED_COLOR,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: COLOR.SELECTED_COLOR,
                        width: 1,
                      ),
                    ),
                    child: OutlineButton(
                        child: new Text(
                          "Filter",
                          style: TextStyle(color: COLOR.white, fontSize: 12),
                        ),
                        onPressed: null,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))))
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
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Leave Balance",
                      style: FONT_CONST.SEMIBOLD_BLACK_14,
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
                              'Code',
                              textAlign: TextAlign.center,
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('Opening',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.SEMIBOLD_BLACK_12),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('Used',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.SEMIBOLD_BLACK_12),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('Balance',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.SEMIBOLD_BLACK_12),
                          ),
                        ),
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
                            child: Text('CL',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.REGULAR_BLACK1_12),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('24.0',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.REGULAR_BLACK1_12),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('0.0',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.REGULAR_BLACK1_12),
                          ),
                        ),
                        VerticalDivider(
                          color: COLOR.textcolor,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Text('24.0',
                                textAlign: TextAlign.center,
                                style: FONT_CONST.REGULAR_BLACK1_12),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget getLeaveStatus() {
    return Column(
      children: <Widget>[
        Container(
          child: Card(
            margin: EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            color: COLOR.white,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Date",
                                style: FONT_CONST.BOLD_BLACK_12,
                              ),
                              margin: EdgeInsets.only(
                                left: 2,
                                top: 10,
                              ),
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                InkWell(
                                  child: Text(_selectedDate,
                                      style: TextStyle(
                                          fontSize: 12, color: COLOR.BLACK)),
                                  onTap: () {
                                    _selectDate(context, 2020, 2026);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.arrow_drop_down),
                                  onPressed: () {
                                    _selectDate(context, 2020, 2026);
                                  },
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "To Date",
                              style: FONT_CONST.BOLD_BLACK_12,
                            ),
                            margin: EdgeInsets.only(
                              left: 2,
                              top: 10,
                            ),
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              InkWell(
                                child: Text(_selectedDate,
                                    style: TextStyle(
                                        fontSize: 12, color: COLOR.BLACK)),
                                onTap: () {
                                  _selectDate(context, 2021, 2026);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_drop_down),
                                onPressed: () {
                                  _selectDate(context, 2021, 2026);
                                },
                              ),
                            ],
                          )),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    width: double.infinity,
                    height: 43,
                    margin: EdgeInsets.only(
                        right: 30, top: 20, left: 30, bottom: 10),
                    decoration: BoxDecoration(
                      color: COLOR.SELECTED_COLOR,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: COLOR.SELECTED_COLOR,
                        width: 1,
                      ),
                    ),
                    child: OutlineButton(
                        child: new Text(
                          "Filter",
                          style: TextStyle(color: COLOR.white, fontSize: 12),
                        ),
                        onPressed: null,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
