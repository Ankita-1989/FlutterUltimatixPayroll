import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:intl/intl.dart';

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  var Monthname, year;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    Monthname = DateFormat.MMMM().format(now);
    year = DateFormat.y().format(now);
    // _selectedDate = DateFormat.yMMMd("en_US").format(now);
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
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //change here don't //worked
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DashboardScreen()));
                      },
                    ),
                    Text(
                      "Ticket Application",
                      style: TextStyle(
                        color: COLOR.white,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: COLOR.white,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DashboardScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Month",
                                          style: FONT_CONST.BOLD_BLACK_15,
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
                                              value: Monthname,
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
                                                return new DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: new Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String newKey) {
                                                setState(() {
                                                  Monthname = newKey;
                                                });
                                              })),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        child: Text(
                                          "Year",
                                          style: FONT_CONST.BOLD_BLACK_15,
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
                                            value: year,
                                            items: <String>[
                                              '2020',
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
                                            ].map((String value) {
                                              return new DropdownMenuItem<
                                                  String>(
                                                value: value,
                                                child: new Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String newKey) {
                                              setState(() {
                                                year = newKey;
                                              });
                                            },
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
                                      style: TextStyle(
                                          color: COLOR.white, fontSize: 16),
                                    ),
                                    onPressed: null,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0))))
                          ],
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
    return Scaffold(
      body: _myWidget,
    );
  }
}
