import 'package:flutter/material.dart';
import 'package:flutter_payrollapp/utils/COLOR.dart';
import 'package:flutter_payrollapp/utils/CommonMethod.dart';
import 'package:flutter_payrollapp/utils/FONT_CONST.dart';

class RegularizeApprovalScreen extends StatefulWidget {
  @override
  _RegularizeApprovalScreenState createState() =>
      _RegularizeApprovalScreenState();
}

class _RegularizeApprovalScreenState extends State<RegularizeApprovalScreen> {
  var canclelatein = false;
  var canclelateout = true;

  @override
  Widget build(BuildContext context) {
    Widget _myWidget = Container(
        height: double.infinity,
        decoration: CommonMethod.baseBackgroundDecoration,
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
                    "Regularization Approvals",
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
                                    Text("Applied for",
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
                              Text("Full day",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 14)),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 14,
                            ),
                            Image.asset(
                              "assets/images/in.png",
                              width: 20,
                              height: 20,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Image.asset(
                              "assets/images/out.png",
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 16,
                              ),
                              Text("09:00",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  )),
                              SizedBox(
                                height: 8,
                              ),
                              Text("17:00",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 12)),
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
                          top: 10, left: 10, bottom: 10, right: 10),
                      child: Row(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Reason',
                              style: FONT_CONST.SEMIBOLD_BLACK_12,
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forget to Punch/Sign In Fggg',
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
                           left: 10,  right: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: CheckboxListTile(
                                title: Text("Cancle Late In",style: FONT_CONST.SEMIBOLD_BLACK_12,),
                                value: canclelatein,
                                onChanged: (newValue) {
                                  setState(() {
                                    canclelatein = newValue;
                                  });
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              )),
                          Expanded(
                            flex: 1,
                            child: CheckboxListTile(
                              title: Text("Cancle Late Out",style: FONT_CONST.SEMIBOLD_BLACK_12),
                              value: canclelateout,
                              onChanged: (newValue) {
                                setState(() {
                                  canclelateout = newValue;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            )
                          )
                        ],
                      ),
                    ),


                    Container(
                      margin: EdgeInsets.only(left: 10, top: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Superior Comment',
                          style: FONT_CONST.BOLD_BLACK_12,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: 'Comment',hintStyle: FONT_CONST.REGULAR_HINT),
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
                                        style: TextStyle(color: COLOR.BLACK,fontSize: 12),
                                      ),
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
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: COLOR.SELECTED_COLOR,
                                    ),
                                  ),
                                  child: OutlineButton(
                                      child: new Text(
                                        "Approve",
                                        style: TextStyle(color: COLOR.white,fontSize: 12),
                                      ),
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
          ],
        ));
    return Scaffold(
      body: _myWidget,
    );
  }
}
