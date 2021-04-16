import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:pie_chart/pie_chart.dart';
import '../utils/COLOR.dart';
import '../utils/FONT_CONST.dart';
import 'Dashboard/sc_dashbord.dart';

class MyAttendance extends StatefulWidget {
  @override
  _MyAttendanceState createState() => _MyAttendanceState();
}
enum LegendShape { Circle, Rectangle }
class _MyAttendanceState extends State<MyAttendance> {
  Map<String, double> dataMap = {
    "Present": 7,
    "leave": 1,
    "Absent": 1,
    "On Duty": 1,
    "Holiday": 0,
    "Week Off": 0,
  };
  List<Color> colorList = [
    COLOR.BORDER,
    COLOR.ABSENT,
    COLOR.LEAVE,
    COLOR.WO,
    COLOR.HO,
  ];
  var date;
  String formattedDate;
  LegendShape _legendShape = LegendShape.Rectangle;

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
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: COLOR.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => DashboardScreen()));
                      },
                    ),
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
                                      fontWeight: FontWeight.w600),
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
                                        fontSize: 15,
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
                            "Monthly Attendance(Mar - 2020)",
                            style: FONT_CONST.SEMIBOLD_BLACK_13,
                          ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 11.0,
                              width: 11.0,
                              decoration: new BoxDecoration(
                                color: COLOR.BORDER,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Present",
                                style: TextStyle(
                                    color: COLOR.BLACK, fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 11.0,
                              width: 11.0,
                              decoration: new BoxDecoration(
                                color: COLOR.ABSENT,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Absent",
                                style: TextStyle(
                                    color: COLOR.BLACK, fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 11.0,
                              width: 11.0,
                              decoration: new BoxDecoration(
                                color: COLOR.LEAVE,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Leave",
                                style: TextStyle(
                                    color: COLOR.BLACK, fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 11.0,
                              width: 11.0,
                              decoration: new BoxDecoration(
                                color: COLOR.WO,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Week Off",
                                style: TextStyle(
                                    color: COLOR.BLACK, fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 11.0,
                              width: 11.0,
                              decoration: new BoxDecoration(
                                color: COLOR.HO,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 2),
                              child: Text(
                                "Holiday",
                                style: TextStyle(
                                    color: COLOR.BLACK, fontSize: 14),
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
                        margin: EdgeInsets.only(top: 12),
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 22,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValueBackground: false,
                            showChartValues: false,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                          ),
                        ),
                      ),
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
