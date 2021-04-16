import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/ui/sc_ticketapproval.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

import 'file:///E:/NafisaAndroid_Projects/FlutterPayroll/flutter_payrollapp/lib/ui/Leave/sc_leaveapplicationapproval.dart';

import '../sc_regularizationapplication.dart';
import 'sc_dashbord.dart';

class ApprovalScreen extends StatefulWidget {
  @override
  _ApprovalScreenState createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Leave Approvals',
      'Attendance Regularization Approvals',
      'Leave Cancellation Approvals',
      'Comp-Off Approvals',
      'Ticket Approvals',
    ];
    var itemCount = 5;
    _onSelected(int index) {
      print("index===================$index");
      setState(() {
        if (index == 0) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  LeaveApplicationApprovalScreen()));
        } else if (index == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  RegularizationApplicationApprovals()));
        } else if (index == 2) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  LeaveApplicationApprovalScreen()));
        } else if (index == 3) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  LeaveApplicationApprovalScreen()));
        } else if (index == 4) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TicketApproval()));
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
              margin: EdgeInsets.only(left: 5, top: 40),
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
                  SizedBox(width: 3,),
                  Text(
                    "Approval",
                    style: TextStyle(
                      color: COLOR.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
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
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    entries[index],
                                    style: FONT_CONST.SEMIBOLD_BLACK_12,
                                  ),
                                ),
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
