import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

import 'sc_dashbord.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'FAQ',
      'Clocking',
      'Attendance',
      'Approvals',
      'Settings',
    ];
    var itemCount = 5;
    _onSelected(int index) {
      print("index===================$index");
      setState(() {
        if (index == 0) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (BuildContext
          //         context) =>
          //             LeaveApplicationApprovalScreen()));
        } else if (index == 1) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (BuildContext
          //         context) =>
          //             RegularizationApplicationApprovals()));
        } else if (index == 2) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (BuildContext
          //         context) =>
          //             LeaveApplicationApprovalScreen()));
        } else if (index == 3) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (BuildContext
          //         context) =>
          //             LeaveApplicationApprovalScreen()));
        } else if (index == 4) {
          // Navigator.of(context).push(
          //     MaterialPageRoute(
          //         builder: (BuildContext
          //         context) =>
          //             LeaveApplicationApprovalScreen()));
        }
      });
    }

    Widget _mychild = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 2, top: 40),
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
                          builder: (BuildContext context) =>
                              DashboardScreen()));
                    },
                  ),
                  Text(
                    "Help Center",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: itemCount > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              _onSelected(index);
                              print(index);
                            },
                            child: Container(
                              height: 46,
                              width: double.infinity,
                              margin:
                                  EdgeInsets.only(left: 10, right: 10, top: 10),
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
                                  border: Border.all(
                                      width: 1, color: Colors.transparent)),
                              child: Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        entries[index],
                                        style: FONT_CONST.SEMIBOLD_BLACK_12,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
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
      body: _mychild,
    );
  }
}
