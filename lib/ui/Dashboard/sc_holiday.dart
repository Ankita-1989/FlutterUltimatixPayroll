import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/list/holiday.dart';
import 'package:flutter_payrollapp/ui/Dashboard/sc_dashbord.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';
import 'package:intl/intl.dart';

import '../../utils/COLOR.dart';

class Holiday extends StatefulWidget {
  @override
  _HolidayState createState() => _HolidayState();
}

class _HolidayState extends State<Holiday> {
  var Monthname, year;
  bool isStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    Monthname = DateFormat.MMMM().format(now);
    year = DateFormat.y().format(now);
  }

  @override
  Widget build(BuildContext context) {
    var itemCount = 2;
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 50),
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
                          builder: (BuildContext context) =>
                              DashboardScreen()));
                    },
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Holiday",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 4, right:4, top: 20),
              child: Card(
                elevation: 10,
                color: COLOR.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        "Holiday List For",
                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 5, right: 5),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          underline: Container(
                            color: COLOR.BLACK,
                            height: 1,
                          ),
                          iconSize: 35,
                          style: FONT_CONST.BOLD_BLACK_12,
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
                            return new DropdownMenuItem<String>(
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
              ),
            ),
            Flexible(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: itemCount > 0
                    ? ListView.builder(
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return holiday(context, index);
                        },
                      )
                    : Center(child: const Text('No items')),
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(
      body: _myWidget,
    );
  }
}
