import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class LeaveApprovalScreen extends StatefulWidget {
  @override
  _LeaveApprovalScreenState createState() => _LeaveApprovalScreenState();
}

class _LeaveApprovalScreenState extends State<LeaveApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [COLOR.SELECTED_COLOR, COLOR.MAIN_COLOR, COLOR.white])),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 8, top: 40),
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
                      Navigator.of(context).pop();
                    },
                  ),
                  Text(
                    "Leave Approvals",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
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
                                child: Text("0002 Mr. Sandip Patel",
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                child: Row(
                                  children: <Widget>[
                                    Text("Applied on",
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12)),
                                    SizedBox(
                                      width: 20,
                                      child: Icon(
                                        Icons.date_range,
                                        size: 16,
                                      ),
                                    ),
                                    Text('02/12/2019',
                                        style: TextStyle(
                                          color: Colors.orange[600],
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Text("Casual Leave",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, bottom: 10, left: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "From Date ",
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                          Text(
                            "03/12/2019",
                            style: FONT_CONST.REGULAR_BLACK1_12,
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "To Date ",
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                          Text(
                            "03/12/2019",
                            style: FONT_CONST.REGULAR_BLACK1_12,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Leave Period',
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '1.0',
                              style: FONT_CONST.REGULAR_BLACK1_12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Leave Balance',
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              '-4.5',
                              style: FONT_CONST.REGULAR_BLACK1_12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Reason',
                          style: FONT_CONST.SEMIBOLD_BLACK_12,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 10, bottom: 10, right: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
                          maxLines: 5,
                          style: FONT_CONST.REGULAR_BLACK1_12,
                        ),
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
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: COLOR.BORDER_COLOR,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: OutlineButton(
                                    child: new Text(
                                      "Reject",
                                      style: TextStyle(
                                          color: COLOR.BLACK,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {},
                                  ))),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  height: 46,
                                  margin: EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    color: COLOR.SELECTED_COLOR,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                  child: OutlineButton(
                                    child: new Text(
                                      "Approve",
                                      style: TextStyle(
                                          color: COLOR.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12),
                                    ),
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(30.0)),
                                    onPressed: () {},
                                  ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
    return Scaffold(
      body: _myWidget,
    );
  }
}
