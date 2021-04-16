import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/list/list_leaveapproval.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';

class LeaveApplicationApprovalScreen extends StatefulWidget {
  @override
  _LeaveApplicationApprovalScreenState createState() =>
      _LeaveApplicationApprovalScreenState();
}

class _LeaveApplicationApprovalScreenState
    extends State<LeaveApplicationApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    var itemCount = 6;
    Widget _myWidget = Container(
      height: double.infinity,
      decoration: CommonMethod.baseBackgroundDecoration,
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
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
                    "Leave Application Approval",
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
                        itemCount: itemCount,
                        itemBuilder: (BuildContext context, int index) {
                          return leaveappapproval(context, index);
                        },
                      )
                    : Center(child: const Text('No items')),
              ),
            )
          ],
        ),
      ),
    );
    return Scaffold(body: _myWidget);
  }
}
